import 'package:equatable/equatable.dart';

enum MembershipStatus { initial, loading, success, failure }

class ApplayMembershipState extends Equatable {
  final MembershipStatus status;
  final String? error;

  const ApplayMembershipState({
    this.status = MembershipStatus.initial,
    this.error,
  });

  ApplayMembershipState copyWith({
    MembershipStatus? status,
    String? error,
  }) {
    return ApplayMembershipState(
      status: status ?? this.status,
      error: error,
    );
  }

  @override
  List<Object?> get props => [status, error ?? ''];
}
