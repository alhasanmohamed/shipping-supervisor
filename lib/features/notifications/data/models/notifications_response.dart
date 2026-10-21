import 'package:shipping_user_app/core/networking/json_helper.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'notifications_response.g.dart';

@JsonSerializable()
class NotificationsResponse extends Equatable {
  @JsonKey(name: 'data')
  final List<NotificationModel> notifications;

  const NotificationsResponse({
    required this.notifications,
  });

  Map<String, dynamic> toJson() => _$NotificationsResponseToJson(this);

  factory NotificationsResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationsResponseFromJson(json);

  @override
  List<Object?> get props => [notifications];
}

@JsonSerializable()
class NotificationModel extends Equatable {
  final int id;
  @JsonKey(name: 'user_id')
  final int userId;
  final Notification notification;
  @JsonKey(name: 'is_read', fromJson: CustomJsonHelper.boolFromInt)
  final bool isRead;
  @JsonKey(name: 'is_confirmed')
  final int? isConfirmed;
  @JsonKey(name: 'created_at')
  final String createdAt;

  const NotificationModel({
    required this.id,
    required this.userId,
    required this.isRead,
    required this.notification,
    required this.createdAt,
    this.isConfirmed,
  });

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  NotificationModel copyWith({
    bool? isRead,
  }) {
    return NotificationModel(
      id: id,
      userId: userId,
      notification: notification,
      isRead: isRead ?? this.isRead,
      createdAt: createdAt,
      isConfirmed: isConfirmed,
    );
  }

  @override
  List<Object?> get props => [
        id,
        userId,
        isRead,
        notification,
        createdAt,
        isConfirmed,
      ];
}

@JsonSerializable()
class Notification extends Equatable {
  final int id;
  final String title;
  final String body;
  final String? type;
  final String? image;
  final String? icon;

  const Notification({
    required this.id,
    required this.title,
    required this.body,
    this.type,
    this.image,
    this.icon,
  });

  Map<String, dynamic> toJson() => _$NotificationToJson(this);

  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);

  @override
  List<Object?> get props => [id, title, body, type, image, icon];
}
