// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationsResponse _$NotificationsResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationsResponse(
      notifications: (json['data'] as List<dynamic>)
          .map((e) => NotificationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NotificationsResponseToJson(
        NotificationsResponse instance) =>
    <String, dynamic>{
      'data': instance.notifications,
    };

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      isRead: CustomJsonHelper.boolFromInt((json['is_read'] as num).toInt()),
      notification:
          Notification.fromJson(json['notification'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String,
      isConfirmed: (json['is_confirmed'] as num?)?.toInt(),
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'notification': instance.notification,
      'is_read': instance.isRead,
      'is_confirmed': instance.isConfirmed,
      'created_at': instance.createdAt,
    };

Notification _$NotificationFromJson(Map<String, dynamic> json) => Notification(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      body: json['body'] as String,
      type: json['type'] as String?,
      image: json['image'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'type': instance.type,
      'image': instance.image,
      'icon': instance.icon,
    };
