import 'package:shipping_user_app/core/local/shared_pref_service/shared_pref_service.dart';
import 'package:shipping_user_app/core/local/secure_storage/secure_storage_service.dart';
import 'package:shipping_user_app/features/login/data/models/login_request_body.dart';
import 'package:shipping_user_app/features/login/data/repo/login_repo.dart';
import 'package:shipping_user_app/features/login/logic/login_state.dart';
import 'package:shipping_user_app/core/helpers/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  final SecureStorageService _secureStorageService;
  final SharedPrefService _sharedPrefService;
  LoginCubit(
    this._loginRepo,
    this._secureStorageService,
    this._sharedPrefService,
  ) : super(const LoginState.initial());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final loginFormKey = GlobalKey<FormState>();

  void validateLoginControllersDoLogin() async {
    if (loginFormKey.currentState!.validate()) {
      emitLoginStates(
        loginRequestBody: LoginRequestBody(
          username: emailController.text,
          password: passwordController.text,
          fcmToken: '',
        ),
      );
    }
  }

  void emitLoginStates({
    required LoginRequestBody loginRequestBody,
  }) async {
    emit(const LoginState.loginLoading());
    final response = await _loginRepo.login(loginRequestBody: loginRequestBody);
    response.when(
      success: (loginResponse) async {
        await Future.wait([
          _secureStorageService.writeString(
            key: AppConstants.kTokenKey,
            value: '', // Save the token returned from the login response
          ),
          _sharedPrefService.setInt(
            key: AppConstants.kUserId,
            value: 0, // Save the user id returned from the login response
          ),
        ]).then((_) {
          emit(LoginState.loginSuccess(loginResponse));
        });
      },
      failure: (error) {
        emit(LoginState.loginError(message: error.message ?? ''));
      },
    );
  }

  void emitLogoutStates() async {
    emit(const LoginState.logoutLoading());
    final response = await _loginRepo.logout();
    response.when(
      success: (data) async {
        emit(const LoginState.logoutSuccess());
        _secureStorageService.remove(key: AppConstants.kTokenKey);
        for (var key in _sharedPrefService.getAllKeys()) {
          if (key != AppConstants.kLangKey && key != AppConstants.kThemeKey) {
            await _sharedPrefService.remove(key: key);
          }
        }
      },
      failure: (error) => emit(LoginState.logoutError(message: error.getAllErrorMessages())),
    );
  }
}
