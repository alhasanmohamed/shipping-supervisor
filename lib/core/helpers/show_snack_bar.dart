import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipping_user_app/core/theming/app_colors.dart';
import 'package:shipping_user_app/core/theming/app_text_styles.dart';


showSnackBar({
  required BuildContext context,
  required String title,
  required SnackBarType type,
  Duration? duration,
  SnackBarBehavior? behavior,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        title,
        style: AppTextStyles.font14Medium.copyWith(color: AppColors.white),
        maxLines: 3,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      backgroundColor: _getColorFromType(type),
      duration: duration ?? const Duration(seconds: 5),
      behavior: behavior ?? SnackBarBehavior.floating,
    ),
  );
}

enum SnackBarType {
  success,
  error,
  warning,
}

dynamic _getColorFromType(SnackBarType type) {
  switch (type) {
    case SnackBarType.success:
      return AppColors.darkGreen;
    case SnackBarType.error:
      return AppColors.red;
    case SnackBarType.warning:
      return AppColors.orange;
    }
}
