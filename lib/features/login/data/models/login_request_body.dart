import 'package:json_annotation/json_annotation.dart';
part 'login_request_body.g.dart';

// Customize the fields based on the API request body
@JsonSerializable()
class LoginRequestBody {
  final String username;
  final String password;
  @JsonKey(name: 'fcm_token')
  final String fcmToken;

  LoginRequestBody({
    required this.username,
    required this.password,
    required this.fcmToken,
  });

  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);
}