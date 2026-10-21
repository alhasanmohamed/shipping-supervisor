import 'package:json_annotation/json_annotation.dart';
part 'confirm_notification_model.g.dart';

@JsonSerializable()
class ConfirmNotificationModel {
  final String type;
  final DateTime? sentTime;

  ConfirmNotificationModel({
    required this.type,
    this.sentTime,
  });

  Map<String, dynamic> toJson() => _$ConfirmNotificationModelToJson(this);

  factory ConfirmNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$ConfirmNotificationModelFromJson(json);
}