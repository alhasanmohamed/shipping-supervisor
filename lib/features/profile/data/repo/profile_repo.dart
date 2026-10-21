import 'package:shipping_user_app/core/networking/api_error_handler.dart';
import 'package:shipping_user_app/core/networking/api_result.dart';
import 'package:shipping_user_app/core/networking/api_service.dart';
import 'package:shipping_user_app/features/profile/data/models/policies_documents_response.dart';

class ProfileRepo {
  final ApiService _apiService;
  ProfileRepo(this._apiService);

  Future<ApiResult<PoliciesDocumentsResponse>> getPoliciesDocuments() async {
    try {
      final response = await _apiService.getPoliciesDocuments();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
