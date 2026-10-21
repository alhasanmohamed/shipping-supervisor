import 'package:shipping_user_app/features/notifications/data/models/edit_notification_request_body.dart';
import 'package:shipping_user_app/features/notifications/data/models/notifications_response.dart';
import 'package:shipping_user_app/features/profile/data/models/policies_documents_response.dart';
import 'package:shipping_user_app/features/register/data/models/register_response_body.dart';
import 'package:shipping_user_app/features/register/data/models/register_request_body.dart';
import 'package:shipping_user_app/features/login/data/models/login_response_body.dart';
import 'package:shipping_user_app/features/login/data/models/login_request_body.dart';
import 'package:shipping_user_app/core/networking/api_constants.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.register)
  // Change the dynamic type to the custom response model
  Future<RegisterResponseBody> register(
    @Body() RegisterRequestBody registerRequestBody,
  );

  @POST(ApiConstants.login)
  // Change the dynamic type to the custom response model
  Future<LoginResponseBody> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  @POST(ApiConstants.logout)
  Future<dynamic> logout();

  @GET(ApiConstants.policiesDocuments)
  Future<PoliciesDocumentsResponse> getPoliciesDocuments();

  @GET(ApiConstants.getUserNotifications)
  Future<NotificationsResponse> getUserNotifications(
    @Path('user_id') int userId,
  );

  @PATCH(ApiConstants.markNotificationAsRead)
  Future<dynamic> markNotificationAsRead(
    @Path("notification_id") int notificationID,
    @Body() EditNotificationRequestBody editNotificationRequestBody,
  );
}
