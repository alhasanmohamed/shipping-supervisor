import 'package:shipping_user_app/core/networking/api_error_handler.dart';
import 'package:shipping_user_app/core/networking/api_result.dart';
import 'package:shipping_user_app/core/networking/api_service.dart';
import 'package:shipping_user_app/features/register/data/models/register_request_body.dart';

class RegisterRepo{
  final ApiService _apiService;
  RegisterRepo(this._apiService);

  // Change dynamic to the custom response model
  Future<ApiResult<dynamic>> register({required RegisterRequestBody registerRequestBody}) async {
    try {
      final response = await _apiService.register(registerRequestBody);
      return ApiResult.success(response);
    } on Exception catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}