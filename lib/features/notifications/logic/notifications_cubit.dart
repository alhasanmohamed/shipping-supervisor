import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipping_user_app/core/helpers/app_constants.dart';
import 'package:shipping_user_app/core/local/shared_pref_service/shared_pref_service.dart';
import 'package:shipping_user_app/features/notifications/data/models/edit_notification_request_body.dart';
import 'package:shipping_user_app/features/notifications/data/models/notification_filter_model.dart';
import 'package:shipping_user_app/features/notifications/data/models/notifications_response.dart';
import 'package:shipping_user_app/features/notifications/data/repo/notifications_repo.dart';
import 'package:shipping_user_app/features/notifications/logic/notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final NotificationsRepo _notificationRepo;
  final SharedPrefService _sharedPrefService;
  NotificationsCubit(this._notificationRepo, this._sharedPrefService)
      : super(const NotificationsState.initial());

  int unreadNotificationCount = 0;
  final List<NotificationModel> notifications = [];
  Set<String> notificationsTypes = {};
  void getNotifications() async {
    emit(const NotificationsState.notificationLoading());
    final response = await _notificationRepo.getUserNotifications(
      _sharedPrefService.getInt(key: AppConstants.kUserId) ?? -1,
    );
    response.when(
      success: (response) {
        notifications.clear();
        clearFilterResults();
        unreadNotificationCount =
            response.notifications.where((element) => !element.isRead).toList().length;
        for (var notification in response.notifications) {
          if (notification.notification.type != null) {
            notificationsTypes.add(notification.notification.type!);
          }
        }
        notifications.addAll(response.notifications);
        emit(NotificationsState.notificationSuccess(response));
      },
      failure: (error) => emit(
        NotificationsState.notificationError(message: error.error?.message ?? ''),
      ),
    );
  }

  void markNotificationAsRead({required int notificationID}) async {
    emit(const NotificationsState.markNotificationLoading());
    final response = await _notificationRepo.markNotificationAsRead(
      notificationID: notificationID,
      editNotificationRequestBody: EditNotificationRequestBody(isRead: true),
    );
    response.maybeWhen(
      orElse: () => {
        unreadNotificationCount -= 1,
        emit(const NotificationsState.markNotificationSuccess()),
      },
      failure: (error) =>
          emit(NotificationsState.markNotificationError(message: error.error?.message ?? '')),
    );
  }

  // ignore: prefer_const_constructors
  final NotificationFilterModel filterModel = NotificationFilterModel(
    // ignore: prefer_const_literals_to_create_immutables
    notificationType: [],
  );
  List<NotificationModel> filterResults = [];
  void runFilter() async {
    filterResults.clear();
    emit(const NotificationsState.notificationLoading());
    await Future.delayed(const Duration(milliseconds: 50));
    if (filterModel.notificationType.isNotEmpty) {
      filterResults = notifications
          .where((notification) =>
              filterModel.notificationType.contains(notification.notification.type))
          .toList();
      emit(
        NotificationsState.notificationSuccess(
          NotificationsResponse(notifications: filterResults),
        ),
      );
    } else {
      emit(
        NotificationsState.notificationSuccess(
          NotificationsResponse(notifications: notifications),
        ),
      );
    }
  }

  void selectNotificationType(String type) async {
    if (filterModel.notificationType.contains(type)) {
      filterModel.notificationType.remove(type);
    } else {
      filterModel.notificationType.add(type);
    }
  }

  void clearFilter() async {
    filterModel.notificationType.clear();
  }

  void clearFilterResults() async {
    filterModel.notificationType.clear();
    filterResults.clear();
  }
}
