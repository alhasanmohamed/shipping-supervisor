import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

import 'package:shipping_user_app/core/helpers/app_constants.dart';
import 'package:shipping_user_app/core/helpers/spacing.dart';
import 'package:shipping_user_app/core/theming/app_colors.dart';
import 'package:shipping_user_app/core/theming/app_text_styles.dart';
import 'package:shipping_user_app/core/widgets/shimmer_widget.dart';
import 'package:shipping_user_app/generated/l10n.dart';
import 'package:shipping_user_app/features/notifications/logic/notifications_cubit.dart';
import 'package:shipping_user_app/features/notifications/logic/notifications_state.dart';
import 'package:shipping_user_app/features/notifications/ui/widgets/notification_card.dart';
import 'package:shipping_user_app/features/notifications/ui/widgets/notification_filter_bottom_sheet.dart';
import 'package:shipping_user_app/features/notifications/data/models/notifications_response.dart' as notifications;

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notificationsCubit = context.read<NotificationsCubit>();
    List<notifications.NotificationModel> dummyNotifications = [
      const notifications.NotificationModel(
        id: 0,
        createdAt: '2024-09-30T08:50:00.000000Z',
        isRead: true,
        notification: notifications.Notification(
          id: 0,
          title: 'New Notification',
          body: 'This is a new notification',
          type: 'Type 1',
          image: '',
          icon: '',
        ),
        userId: 0,
      ),
      const notifications.NotificationModel(
        id: 0,
        createdAt: '2024-09-30T08:50:00.000000Z',
        isRead: true,
        notification: notifications.Notification(
          id: 0,
          title: 'New Notification',
          body: 'This is a new notification',
          type: 'Type 1',
          image: '',
          icon: '',
        ),
        userId: 0,
      ),
      const notifications.NotificationModel(
        id: 0,
        createdAt: '2024-10-01T08:50:00.000000Z',
        isRead: true,
        notification: notifications.Notification(
          id: 0,
          title: 'New Notification',
          body: 'This is a new notification',
          type: 'Type 1',
          image: '',
          icon: '',
        ),
        userId: 0,
      ),
      const notifications.NotificationModel(
        id: 0,
        createdAt: '2024-10-01T08:50:00.000000Z',
        isRead: true,
        notification: notifications.Notification(
          id: 0,
          title: 'New Notification',
          body: 'This is a new notification',
          type: 'Type 1',
          image: '',
          icon: '',
        ),
        userId: 0,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).notifications,
          style: AppTextStyles.font18Bold,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => showModalBottomSheet(
              isScrollControlled: true,
              isDismissible: true,
              context: context,
              builder: (context) => const NotificationFilterBottomSheet(),
            ),
            icon: const Icon(CupertinoIcons.slider_horizontal_3),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          notificationsCubit.clearFilterResults();
          notificationsCubit.getNotifications();
        },
        child: CustomScrollView(
          slivers: [
            BlocBuilder<NotificationsCubit, NotificationsState>(
              builder: (context, state) => state.maybeWhen(
                orElse: () {
                  if (notificationsCubit.filterResults.isEmpty) {
                    return const SliverToBoxAdapter(
                      child: SizedBox.shrink(),
                    );
                  } else {
                    return SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
                      sliver: SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${S.of(context).results} ${notificationsCubit.filterResults.length}',
                              style: AppTextStyles.font14SemiBoldGray,
                            ),
                            const VerticalSpace(10),
                            Wrap(
                              alignment: WrapAlignment.start,
                              spacing: 5,
                              children: List.generate(
                                notificationsCubit.filterModel.notificationType.length,
                                (index) => Chip(
                                  deleteIconBoxConstraints: const BoxConstraints(
                                    minHeight: 25,
                                    minWidth: 25,
                                  ),
                                  padding: EdgeInsets.zero,
                                  visualDensity: VisualDensity.compact,
                                  labelPadding: const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(AppConstants.kRadius12),
                                    side: const BorderSide(
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  label: Builder(builder: (context) {
                                    return Text(
                                      notificationsCubit.filterModel.notificationType.firstWhere(
                                          (element) =>
                                              notificationsCubit.filterModel.notificationType
                                                  .elementAt(index) ==
                                              element),
                                      style: AppTextStyles.font12Medium,
                                    );
                                  }),
                                  onDeleted: () {
                                    notificationsCubit.filterModel.notificationType.removeAt(index);
                                    notificationsCubit.runFilter();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            BlocBuilder<NotificationsCubit, NotificationsState>(
              builder: (context, state) => state.maybeWhen(
                orElse: () {
                  if (notificationsCubit.filterResults.isNotEmpty) {
                    return SliverToBoxAdapter(
                      child: GroupedListView<notifications.NotificationModel, String>(
                        elements: notificationsCubit.filterResults,
                        groupBy: (notification) => DateFormat('yyyy-MM-dd', 'en')
                            .format(DateTime.parse(notification.createdAt).toLocal()),
                        itemComparator: (notification1, notification2) =>
                            DateTime.parse(notification2.createdAt).toLocal().compareTo(
                                  DateTime.parse(notification1.createdAt).toLocal(),
                                ),
                        groupComparator: (group1, group2) {
                          DateTime firstDate = DateTime.parse(group1).toLocal();
                          DateTime secondDate = DateTime.parse(group2).toLocal();
                          return DateTime(secondDate.year, secondDate.month, secondDate.day, 00, 00,
                                  00, 00, 00)
                              .compareTo(DateTime(firstDate.year, firstDate.month, firstDate.day,
                                  00, 00, 00, 00, 00));
                        },
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: AppConstants.kVerticalPadding8,
                        ),
                        groupSeparatorBuilder: (value) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppConstants.kHorizontalPadding12,
                              vertical: AppConstants.kVerticalPadding10,
                            ),
                            child: Builder(builder: (context) {
                              DateTime date = DateTime.parse(value).toLocal();
                              return Text(
                                DateFormat.yMMMd('en').format(date),
                                style: AppTextStyles.font12Medium.copyWith(
                                  color: AppColors.primaryColor,
                                ),
                              );
                            }),
                          );
                        },
                        itemBuilder: (context, element) => NotificationCard(
                          notification: element,
                          index: notificationsCubit.filterResults.indexOf(element),
                          notificationsResponse: notificationsCubit.filterResults,
                        ),
                      ),
                    );
                  }
                  if (notificationsCubit.notifications.isEmpty) {
                    return SliverFillRemaining(
                      hasScrollBody: false,
                      fillOverscroll: false,
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.notifications_off_outlined,
                              size: 100,
                              color: AppColors.primaryColor,
                            ),
                            Text(
                              S.of(context).no_notifications_found,
                              style: AppTextStyles.font16Medium,
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return SliverToBoxAdapter(
                      child: GroupedListView<notifications.NotificationModel, String>(
                        elements: notificationsCubit.notifications,
                        groupBy: (notification) => DateFormat('yyyy-MM-dd', 'en')
                            .format(DateTime.parse(notification.createdAt).toLocal()),
                        itemComparator: (notification1, notification2) =>
                            DateTime.parse(notification2.createdAt).toLocal().compareTo(
                                  DateTime.parse(notification1.createdAt).toLocal(),
                                ),
                        groupComparator: (group1, group2) {
                          DateTime firstDate = DateTime.parse(group1).toLocal();
                          DateTime secondDate = DateTime.parse(group2).toLocal();
                          return DateTime(secondDate.year, secondDate.month, secondDate.day, 00, 00,
                                  00, 00, 00)
                              .compareTo(DateTime(firstDate.year, firstDate.month, firstDate.day,
                                  00, 00, 00, 00, 00));
                        },
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: AppConstants.kVerticalPadding8,
                        ),
                        groupSeparatorBuilder: (value) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppConstants.kHorizontalPadding12,
                              vertical: AppConstants.kVerticalPadding10,
                            ),
                            child: Builder(builder: (context) {
                              DateTime date = DateTime.parse(value).toLocal();
                              return Text(
                                DateFormat.yMMMd('en').format(date),
                                style: AppTextStyles.font12Medium.copyWith(
                                  color: AppColors.primaryColor,
                                ),
                              );
                            }),
                          );
                        },
                        itemBuilder: (context, element) => NotificationCard(
                          notification: element,
                          index: notificationsCubit.notifications.indexOf(element),
                          notificationsResponse: notificationsCubit.notifications,
                        ),
                      ),
                    );
                  }
                },
                notificationLoading: () {
                  return SliverFillRemaining(
                    hasScrollBody: true,
                    fillOverscroll: false,
                    child: SkeletonizerWidget(
                      child: GroupedListView<notifications.NotificationModel, DateTime>(
                        elements: dummyNotifications,
                        groupBy: (element) {
                          DateTime date = DateTime.parse(element.createdAt);
                          return DateTime(date.year, date.month, date.day);
                        },
                        itemComparator: (item1, item2) =>
                            item2.createdAt.compareTo(item1.createdAt),
                        groupComparator: (group1, group2) => group2.compareTo(group1),
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: AppConstants.kVerticalPadding8,
                        ),
                        groupSeparatorBuilder: (value) => Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppConstants.kHorizontalPadding12,
                            vertical: AppConstants.kVerticalPadding10,
                          ),
                          child: Text(
                            DateFormat.yMMMd('en').format(value),
                            style: AppTextStyles.font12Medium.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                        itemBuilder: (context, element) => NotificationCard(
                          notification: element,
                          index: dummyNotifications.indexOf(element),
                          notificationsResponse: dummyNotifications,
                        ),
                      ),
                    ),
                  );
                },
                notificationSuccess: (response) {
                  if (notificationsCubit.filterResults.isNotEmpty) {
                    return SliverToBoxAdapter(
                      child: GroupedListView<notifications.NotificationModel, String>(
                        elements: notificationsCubit.filterResults,
                        groupBy: (notification) => DateFormat('yyyy-MM-dd', 'en')
                            .format(DateTime.parse(notification.createdAt).toLocal()),
                        itemComparator: (notification1, notification2) =>
                            DateTime.parse(notification2.createdAt).toLocal().compareTo(
                                  DateTime.parse(notification1.createdAt).toLocal(),
                                ),
                        groupComparator: (group1, group2) {
                          DateTime firstDate = DateTime.parse(group1).toLocal();
                          DateTime secondDate = DateTime.parse(group2).toLocal();
                          return DateTime(secondDate.year, secondDate.month, secondDate.day, 00, 00,
                                  00, 00, 00)
                              .compareTo(DateTime(firstDate.year, firstDate.month, firstDate.day,
                                  00, 00, 00, 00, 00));
                        },
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: AppConstants.kVerticalPadding8,
                        ),
                        groupSeparatorBuilder: (value) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppConstants.kHorizontalPadding12,
                              vertical: AppConstants.kVerticalPadding10,
                            ),
                            child: Builder(builder: (context) {
                              DateTime date = DateTime.parse(value).toLocal();
                              return Text(
                                DateFormat.yMMMd('en').format(date),
                                style: AppTextStyles.font12Medium.copyWith(
                                  color: AppColors.primaryColor,
                                ),
                              );
                            }),
                          );
                        },
                        itemBuilder: (context, element) => NotificationCard(
                          notification: element,
                          index: notificationsCubit.filterResults.indexOf(element),
                          notificationsResponse: notificationsCubit.filterResults,
                        ),
                      ),
                    );
                  }
                  if (notificationsCubit.notifications.isEmpty) {
                    return SliverFillRemaining(
                      hasScrollBody: false,
                      fillOverscroll: false,
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.notifications_off_outlined,
                              size: 100,
                              color: AppColors.primaryColor,
                            ),
                            Text(
                              S.of(context).no_notifications_found,
                              style: AppTextStyles.font16Medium,
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return SliverToBoxAdapter(
                      child: GroupedListView<notifications.NotificationModel, String>(
                        elements: notificationsCubit.notifications,
                        groupBy: (notification) => DateFormat('yyyy-MM-dd', 'en')
                            .format(DateTime.parse(notification.createdAt).toLocal()),
                        itemComparator: (notification1, notification2) =>
                            DateTime.parse(notification2.createdAt).toLocal().compareTo(
                                  DateTime.parse(notification1.createdAt).toLocal(),
                                ),
                        groupComparator: (group1, group2) {
                          DateTime firstDate = DateTime.parse(group1).toLocal();
                          DateTime secondDate = DateTime.parse(group2).toLocal();
                          return DateTime(secondDate.year, secondDate.month, secondDate.day, 00, 00,
                                  00, 00, 00)
                              .compareTo(DateTime(firstDate.year, firstDate.month, firstDate.day,
                                  00, 00, 00, 00, 00));
                        },
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: AppConstants.kVerticalPadding8,
                        ),
                        groupSeparatorBuilder: (value) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppConstants.kHorizontalPadding12,
                              vertical: AppConstants.kVerticalPadding10,
                            ),
                            child: Builder(builder: (context) {
                              DateTime date = DateTime.parse(value).toLocal();
                              return Text(
                                DateFormat.yMMMd('en').format(date),
                                style: AppTextStyles.font12Medium.copyWith(
                                  color: AppColors.primaryColor,
                                ),
                              );
                            }),
                          );
                        },
                        itemBuilder: (context, element) => NotificationCard(
                          notification: element,
                          index: notificationsCubit.notifications.indexOf(element),
                          notificationsResponse: notificationsCubit.notifications,
                        ),
                      ),
                    );
                  }
                },
                notificationError: (message) {
                  return SliverFillRemaining(
                    hasScrollBody: false,
                    fillOverscroll: false,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.error_outline,
                            size: 100,
                            color: AppColors.red,
                          ),
                          Text(
                            message,
                            style: AppTextStyles.font16Medium,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
