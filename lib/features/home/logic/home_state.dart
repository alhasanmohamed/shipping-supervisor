import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_state.freezed.dart';

@freezed
abstract class HomeState<T> with _$HomeState<T> {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.representativesLoading() = RepresentativesLoading;
  const factory HomeState.representativesSuccess() = RepresentativesSuccess;
  const factory HomeState.representativesError({required String message}) = RepresentativesError;
  const factory HomeState.updateStatus(bool status) = UpdateStatus;
}
