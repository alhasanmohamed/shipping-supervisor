import 'package:freezed_annotation/freezed_annotation.dart';
part 'permission_state.freezed.dart';

@freezed
abstract class PermissionState<T> with _$PermissionState<T> {
  const factory PermissionState.initial() = _Initial;

  const factory PermissionState.checkLocationPermissionLoading() = CheckLocationPermissionLoading;
  const factory PermissionState.checkLocationPermissionSuccess() = CheckLocationPermissionSuccess;
  const factory PermissionState.checkLocationPermissionError() = CheckLocationPermissionError;
}