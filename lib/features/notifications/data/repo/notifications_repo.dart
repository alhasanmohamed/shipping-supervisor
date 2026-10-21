import 'package:shipping_user_app/core/networking/api_error_handler.dart';
import 'package:shipping_user_app/core/networking/api_result.dart';
import 'package:shipping_user_app/core/networking/api_service.dart';
import 'package:shipping_user_app/features/notifications/data/models/edit_notification_request_body.dart';
import 'package:shipping_user_app/features/notifications/data/models/notifications_response.dart';

class NotificationsRepo {
  final ApiService _apiService;
  NotificationsRepo(this._apiService);

  Future<ApiResult<NotificationsResponse>> getUserNotifications(int userId) async {
    try {
      final response = await _apiService.getUserNotifications(userId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<dynamic>> markNotificationAsRead({
    required int notificationID,
    required EditNotificationRequestBody editNotificationRequestBody,
  }) async {
    try {
      return ApiResult.success(
        await _apiService.markNotificationAsRead(notificationID, editNotificationRequestBody),
      );
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
