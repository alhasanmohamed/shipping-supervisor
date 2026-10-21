import 'package:shipping_user_app/core/helpers/extensions.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shipping_user_app/generated/l10n.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final int? status;
  final String? message;
  final Map<String, dynamic>? errors;
  final Error? error;
  @JsonKey(name: 'status-code')
  final int? statusCode;

  ApiErrorModel({
    this.status,
    this.message,
    this.errors,
    this.error,
    this.statusCode,
  });

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) => _$ApiErrorModelFromJson(json);

  String getAllErrorMessages() {
    if (errors.isNullOrEmpty()) return message ?? S.current.error_unknown;

    final List<String> formattedMessages = [];
    errors!.forEach((key, value) {
      for (var error in value) {
        formattedMessages.add('$error');
      }
    });

    return formattedMessages.join('\n');
  }
}

@JsonSerializable()
class Error {
  final String? message;
  @JsonKey(name: 'status-code')
  final int? statusCode;

  Error({
    this.message,
    this.statusCode,
  });

  Map<String, dynamic> toJson() => _$ErrorToJson(this);

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);
}
