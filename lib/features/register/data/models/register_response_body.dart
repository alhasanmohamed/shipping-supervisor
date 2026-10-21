import 'package:json_annotation/json_annotation.dart';
part 'register_response_body.g.dart';

// Customize the fields based on the API request body
@JsonSerializable()
class RegisterResponseBody {
  final String token;

  RegisterResponseBody({
    required this.token,
  });

  Map<String, dynamic> toJson() => _$RegisterResponseBodyToJson(this);

  factory RegisterResponseBody.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseBodyFromJson(json);
}
