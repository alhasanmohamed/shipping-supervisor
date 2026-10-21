import 'package:json_annotation/json_annotation.dart';
part 'login_response_body.g.dart';

// Customize the fields based on the API request body
@JsonSerializable()
class LoginResponseBody {
  final String token;

  LoginResponseBody({
    required this.token,
  });

  Map<String, dynamic> toJson() => _$LoginResponseBodyToJson(this);

  factory LoginResponseBody.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseBodyFromJson(json);
}
