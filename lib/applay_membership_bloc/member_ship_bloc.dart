import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart' as dio;

import 'applay_member_ship_event.dart';
import 'applay_membership_states.dart';

class ApplayMembershipBloc
    extends Bloc<ApplayMembershipEvent, ApplayMembershipState> {
  final dio.Dio dioClient;

  ApplayMembershipBloc({dio.Dio? client})
      : dioClient = client ?? dio.Dio(),
        super(const ApplayMembershipState()) {
    dioClient.interceptors.add(
      dio.LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        error: true,
      ),
    );

    on<ApplayMembershipSubmitted>(_onSubmitted);
  }

  Future<void> _onSubmitted(ApplayMembershipSubmitted event,
      Emitter<ApplayMembershipState> emit,
      ) async {
    emit(state.copyWith(status: MembershipStatus.loading));

    try {
      final formDataMap = {
        'name': event.name,
        'membership_id': event.membershipId,
        'house_no': event.houseNo,
        'street': event.street,
        'city': event.city,
        'district': event.district,
        'state': event.state,
        'landmark': event.landmark,
        'pincode': event.pincode,
        'contact_no': event.contactNo,
      };

      // agar image bhi bhejna ho to uncomment karke use karo
      // if (event.image != null && event.image!.existsSync()) {
      //   final mimeType = lookupMimeType(event.image!.path);
      //   if (mimeType != null) {
      //     final parts = mimeType.split('/');
      //     formDataMap['image'] = await dio.MultipartFile.fromFile(
      //       event.image!.path,
      //       filename: event.image!.path.split('/').last,
      //       contentType: MediaType(parts[0], parts[1]),
      //     );
      //   }
      // }

      final formData = dio.FormData.fromMap(formDataMap);

      final response = await dioClient.post(
        " AppApi.baseUrl + AppApi.applayMemberShipCard",
        data: formData,
        options: dio.Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
      );


      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(state.copyWith(status: MembershipStatus.success));
      } else {
        emit(state.copyWith(
          status: MembershipStatus.failure,
          error: 'Failed: ${response.statusCode}',
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: MembershipStatus.failure,
        error: e.toString(),
      ));
    }
  }
}
