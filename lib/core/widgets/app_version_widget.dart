import 'package:shipping_user_app/core/theming/app_text_styles.dart';
import 'package:shipping_user_app/core/theming/app_colors.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shipping_user_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class AppVersionWidget extends StatelessWidget {
  const AppVersionWidget({super.key});

  @override
  Widget build(BuildContext context) {

    Future<String> getAppVersion() async {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      return packageInfo.version;
    }

    return FutureBuilder(
      future: getAppVersion(),
      builder: (context, snapshot) {
        String versionText;
        if (snapshot.connectionState == ConnectionState.waiting) {
          versionText = '...';
        } else if (snapshot.hasError) {
          versionText = 'N/A';
        } else {
          versionText = snapshot.data ?? '1.0.0';
        }
        return RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
            children: [
              TextSpan(
                text: '${S.of(context).app_version}: ',
                style: AppTextStyles.font12Medium.copyWith(
                  color: AppColors.darkGray,
                ),
              ),
              TextSpan(
                text: versionText,
                style: AppTextStyles.font12Medium.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
