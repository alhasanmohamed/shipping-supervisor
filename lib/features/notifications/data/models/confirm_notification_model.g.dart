// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmNotificationModel _$ConfirmNotificationModelFromJson(
        Map<String, dynamic> json) =>
    ConfirmNotificationModel(
      type: json['type'] as String,
      sentTime: json['sentTime'] == null
          ? null
          : DateTime.parse(json['sentTime'] as String),
    );

Map<String, dynamic> _$ConfirmNotificationModelToJson(
        ConfirmNotificationModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'sentTime': instance.sentTime?.toIso8601String(),
    };
