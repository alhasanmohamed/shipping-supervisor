import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:shipping_user_app/core/helpers/app_constants.dart';
import 'package:shipping_user_app/core/helpers/spacing.dart';
import 'package:shipping_user_app/core/theming/app_colors.dart';
import 'package:shipping_user_app/core/theming/app_text_styles.dart';
import 'package:shipping_user_app/core/widgets/app_text_button.dart';
import 'package:shipping_user_app/generated/l10n.dart';
import 'package:shipping_user_app/features/notifications/logic/notifications_cubit.dart';

class NotificationFilterBottomSheet extends StatelessWidget {
  const NotificationFilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final notificationsCubit = context.read<NotificationsCubit>();
    return StatefulBuilder(
      builder: (context, setState) {
        return BottomSheet(
          backgroundColor: Theme.of(context).dialogTheme.backgroundColor,
          dragHandleColor: AppColors.secondGray,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppConstants.kRadius25),
              topRight: Radius.circular(AppConstants.kRadius25),
            ),
          ),
          showDragHandle: false,
          dragHandleSize: const Size(50, 5),
          enableDrag: false,
          onClosing: () {},
          builder: (BuildContext context) => ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.kHorizontalPadding16,
                  vertical: AppConstants.kVerticalPadding8,
                ),
                child: Row(
                  children: [
                    Text(
                      S.of(context).filter,
                      style: AppTextStyles.font16Bold,
                    ),
                    const Spacer(),
                    IconButton(
                      icon: Transform.rotate(
                        angle: 3.14 / 4,
                        child: const Icon(Icons.add_circle_outline),
                      ),
                      onPressed: context.pop,
                    ),
                  ],
                ),
              ),
              const VerticalSpace(10),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.kHorizontalPadding16,
                ),
                child: Text(
                  S.of(context).status,
                  style: AppTextStyles.font16Bold,
                ),
              ),
              const VerticalSpace(10),
              if (notificationsCubit.notificationsTypes.isNotEmpty)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: notificationsCubit.notificationsTypes.length,
                  itemBuilder: (context, index) => StatefulBuilder(
                    builder: (context, setState) {
                      return ListTileTheme(
                        horizontalTitleGap: 5,
                        child: CheckboxListTile(
                          value: notificationsCubit.filterModel.notificationType.contains(
                            notificationsCubit.notificationsTypes.elementAt(index),
                          ),
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          onChanged: (value) {
                            setState(() {
                              notificationsCubit.selectNotificationType(
                                notificationsCubit.notificationsTypes.elementAt(index),
                              );
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          dense: true,
                          visualDensity: VisualDensity.compact,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: AppConstants.kHorizontalPadding16,
                          ),
                          title: Text(
                            notificationsCubit.notificationsTypes.elementAt(index),
                            style: AppTextStyles.font14SemiBold,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              if (notificationsCubit.notificationsTypes.isEmpty)
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: AppConstants.kVerticalPadding16,
                    ),
                    child: Text(
                      'No Types assigned to any notification',
                      style: AppTextStyles.font16Medium,
                    ),
                  ),
                ),
              const VerticalSpace(10),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.kHorizontalPadding14,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: AppTextButton(
                        buttonText: S.of(context).done,
                        onPressed: () {
                          context.pop();
                          notificationsCubit.runFilter();
                        },
                      ),
                    ),
                    const HorizontalSpace(10),
                    Expanded(
                      child: AppTextButton(
                        backgroundColor: AppColors.secondGray,
                        textStyle: AppTextStyles.font18SemiBoldWhite.copyWith(
                          color: AppColors.black,
                        ),
                        buttonText: S.of(context).reset,
                        onPressed: () {
                          setState(() {
                            notificationsCubit.clearFilter();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const VerticalSpace(20),
            ],
          ),
        );
      },
    );
  }
}
