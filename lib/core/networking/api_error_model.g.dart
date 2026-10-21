// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiErrorModel _$ApiErrorModelFromJson(Map<String, dynamic> json) =>
    ApiErrorModel(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      errors: json['errors'] as Map<String, dynamic>?,
      error: json['error'] == null
          ? null
          : Error.fromJson(json['error'] as Map<String, dynamic>),
      statusCode: (json['status-code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ApiErrorModelToJson(ApiErrorModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
      'error': instance.error,
      'status-code': instance.statusCode,
    };

Error _$ErrorFromJson(Map<String, dynamic> json) => Error(
      message: json['message'] as String?,
      statusCode: (json['status-code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ErrorToJson(Error instance) => <String, dynamic>{
      'message': instance.message,
      'status-code': instance.statusCode,
    };
