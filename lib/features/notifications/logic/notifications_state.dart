import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shipping_user_app/features/notifications/data/models/notifications_response.dart';
part 'notifications_state.freezed.dart';

@freezed
abstract class NotificationsState<T> with _$NotificationsState<T> {
  const factory NotificationsState.initial() = _Initial;
  const factory NotificationsState.notificationLoading() = NotificationLoading;
  const factory NotificationsState.notificationSuccess(NotificationsResponse response) = NotificationSuccess;
  const factory NotificationsState.notificationError({required String message}) = NotificationError;

  const factory NotificationsState.markNotificationLoading() = MarkNotificationLoading;
  const factory NotificationsState.markNotificationSuccess() = MarkNotificationSuccess;
  const factory NotificationsState.markNotificationError({required String message}) = MarkNotificationError;

}