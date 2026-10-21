import 'package:json_annotation/json_annotation.dart';
part 'edit_notification_request_body.g.dart';

@JsonSerializable()
class EditNotificationRequestBody {
  @JsonKey(name: 'is_read')
  final bool isRead;

  EditNotificationRequestBody({
    required this.isRead,
  });

  Map<String, dynamic> toJson() => _$EditNotificationRequestBodyToJson(this);

  factory EditNotificationRequestBody.fromJson(Map<String, dynamic> json) =>
      _$EditNotificationRequestBodyFromJson(json);
}
