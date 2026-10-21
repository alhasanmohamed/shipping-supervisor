import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shipping_user_app/core/theming/app_colors.dart';
import 'package:shipping_user_app/core/widgets/profile_image.dart';
import 'package:shipping_user_app/core/helpers/app_constants.dart';
import 'package:shipping_user_app/core/theming/app_text_styles.dart';
import 'package:shipping_user_app/features/home/data/models/representative_model.dart';
import 'package:shipping_user_app/generated/l10n.dart';

class RepresentativeCardWidget extends StatelessWidget {
  final RepresentativeModel representative;
  final bool isOnline;
  final Function()? onTap;
  const RepresentativeCardWidget({super.key, required this.representative, this.onTap, required this.isOnline});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: onTap,
          tileColor: AppColors.gray,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.kRadius25),
          ),
          leading: Badge(
            alignment: AlignmentDirectional.topStart,
            backgroundColor: AppColors.green,
            isLabelVisible: isOnline,
            largeSize: 10,
            smallSize: 10,
            child: ProfileImage(
              link: representative.avatar ?? '',
              radius: 20,
            ),
          ),
          title: Text(
            representative.name,
            style: AppTextStyles.font16Bold.copyWith(
              color: AppColors.white,
            ),
          ),
          subtitle: Builder(
            builder: (context) {
              if (representative.lastSeen == null) {
                return Text(
                  '${S.of(context).last_seen}: ${S.of(context).unknown}',
                  style: AppTextStyles.font14Medium.copyWith(
                    color: AppColors.white,
                  ),
                );
              } else {
                return Text(
                  isOnline
                      ? S.of(context).active_now
                      : '${S.of(context).last_seen}: ${DateFormat.yMd().add_jm().format(DateTime.parse(representative.lastSeen!).toLocal())}',
                  style: AppTextStyles.font14Medium.copyWith(
                    color: AppColors.white,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
