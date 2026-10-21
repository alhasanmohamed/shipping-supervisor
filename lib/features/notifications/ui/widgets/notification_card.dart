import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:shipping_user_app/core/helpers/app_constants.dart';
import 'package:shipping_user_app/core/routing/routes.dart';
import 'package:shipping_user_app/core/theming/app_colors.dart';

import 'package:shipping_user_app/core/theming/app_text_styles.dart';
import 'package:shipping_user_app/features/notifications/data/models/notifications_response.dart';
import 'package:shipping_user_app/features/notifications/logic/notifications_cubit.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel notification;
  final int index;
  final List<NotificationModel> notificationsResponse;
  final Color? tileIconColor;
  const NotificationCard({
    super.key,
    required this.notification,
    required this.index,
    required this.notificationsResponse,
    this.tileIconColor,
  });

  @override
  Widget build(BuildContext context) {
    final notificationsCubit = context.read<NotificationsCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.kHorizontalPadding14,
        vertical: AppConstants.kVerticalPadding6,
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.kRadius12),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppConstants.kHorizontalPadding6,
        ),
        titleAlignment: ListTileTitleAlignment.top,
        leading: Card(
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: const CircleBorder(),
          color: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.all(AppConstants.kRadius8),
            child: CachedNetworkImage(
              imageUrl: notification.notification.icon ?? '',
              width: 30.w,
              height: 30.h,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => Icon(
                Icons.notifications,
                color: AppColors.primaryColor,
                size: 30.r,
              ),
              errorListener: (value) {},
            ),
          ),
        ),
        title: Text(
          notification.notification.title,
          style: AppTextStyles.font14Bold,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notification.notification.title,
              style: AppTextStyles.font12Medium,
            ),
            Text(
              DateFormat.jmz().format(DateTime.parse(notification.createdAt).toLocal()),
              style: AppTextStyles.font12Medium.copyWith(color: AppColors.gray),
            ),
          ],
        ),
        tileColor: notification.isRead
            ? Theme.of(context).cardColor
            : AppColors.primaryColor.withValues(alpha: 0.1),
        onTap: () {
          context.push(Routes.notificationDetailsScreen, extra: notification);
          if (!notification.isRead) {
            notificationsResponse[index] = notificationsResponse[index].copyWith(
              isRead: true,
            );
            notificationsCubit.markNotificationAsRead(
              notificationID: notification.id,
            );
          }
        },
      ),
    );
  }
}
