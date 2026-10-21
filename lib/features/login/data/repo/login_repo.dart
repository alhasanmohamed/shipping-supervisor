import 'package:shipping_user_app/core/networking/api_error_handler.dart';
import 'package:shipping_user_app/core/networking/api_result.dart';
import 'package:shipping_user_app/core/networking/api_service.dart';
import 'package:shipping_user_app/features/login/data/models/login_request_body.dart';

class LoginRepo {
  final ApiService _apiService;
  LoginRepo(this._apiService);

  // Change dynamic to the custom response model
  Future<ApiResult<dynamic>> login({required LoginRequestBody loginRequestBody}) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<dynamic>> logout() async {
    try {
      final response = await _apiService.logout();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
