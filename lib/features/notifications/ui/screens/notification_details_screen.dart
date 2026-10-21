import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shipping_user_app/core/helpers/app_constants.dart';
import 'package:shipping_user_app/core/helpers/spacing.dart';
import 'package:shipping_user_app/core/theming/app_colors.dart';
import 'package:shipping_user_app/core/theming/app_text_styles.dart';
import 'package:shipping_user_app/features/notifications/data/models/notifications_response.dart';

class NotificationDetailsScreen extends StatelessWidget {
  final NotificationModel notification;
  const NotificationDetailsScreen({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          notification.notification.title,
          style: AppTextStyles.font16Bold,
        ),
      ),
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: AppConstants.kHorizontalPadding14,
              vertical: AppConstants.kVerticalPadding6,
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(
                    height: 200,
                    child: Card(
                      elevation: 0,
                      margin: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppConstants.kRadius12),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: CachedNetworkImage(
                        imageUrl: notification.notification.image ?? '',
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) => const Icon(
                          Icons.notifications_active_outlined,
                          color: AppColors.primaryColor,
                          size: 100,
                        ),
                        errorListener: (value) {},
                      ),
                    ),
                  ),
                  const VerticalSpace(14),
                  Text(
                    notification.notification.body,
                    style: AppTextStyles.font14Medium,
                  ),
                  const VerticalSpace(10),
                  Text(
                    DateFormat.yMMMMd()
                        .add_jm()
                        .format(DateTime.parse(notification.createdAt).toLocal()),
                    style: AppTextStyles.font14Medium.copyWith(color: AppColors.gray),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
