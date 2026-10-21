import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile_state.freezed.dart';

@freezed
abstract class ProfileState<T> with _$ProfileState<T> {
  const factory ProfileState.initial() = _Initial;

  const factory ProfileState.getPoliciesDocumentsLoading() = GetPoliciesDocumentsLoading;
  const factory ProfileState.getPoliciesDocumentsSuccess() = GetPoliciesDocumentsSuccess;
  const factory ProfileState.getPoliciesDocumentsError({required String message}) = GetPoliciesDocumentsError;
}