import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_apps/api_bloc/post_api_event.dart';
import 'package:mvvm_apps/api_bloc/post_api_states.dart';
import 'package:mvvm_apps/api_repositry/api_repositry.dart';

import '../utlis/post_api_status.dart';

class PostApiBloc extends Bloc<PostApiEvents, PostApiStates> {
  ApiRepository apiRepository = ApiRepository();
   PostApiBloc():super(PostApiStates()){
     on<GetPostApiData>(_fetchData);
   }
  Future<void> _fetchData(GetPostApiData event, Emitter<PostApiStates> emit,) async {
    emit(state.copyWith(status: PostStatus.loading));
    try {
      final value = await apiRepository.fetchData();
      emit(state.copyWith(status: PostStatus.success, postApiModules: value,
      ));
      print("Fetched ${value.length} posts ✅");
    } catch (e) {
      emit(state.copyWith(status: PostStatus.error));
      print("Error fetching data: $e");
    }
  }

}