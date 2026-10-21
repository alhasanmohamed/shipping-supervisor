import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_state.freezed.dart';

@freezed
abstract class LoginState<T> with _$LoginState<T> {
  const factory LoginState.initial() = _Initial;

  const factory LoginState.loginLoading() = LoginLoading;
  const factory LoginState.loginSuccess(dynamic loginResponse) = LoginSuccess;
  const factory LoginState.loginError({required String message}) = LoginError;

  const factory LoginState.logoutLoading() = LogoutLoading;
  const factory LoginState.logoutSuccess() = LogoutSuccess;
  const factory LoginState.logoutError({required String message}) = LogoutError;
}