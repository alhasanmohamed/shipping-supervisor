import 'package:shipping_user_app/core/theming/app_text_styles.dart';
import 'package:shipping_user_app/core/helpers/app_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipping_user_app/core/theming/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final String? buttonText;
  final Widget? child;
  final TextStyle? textStyle;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  const AppTextButton({
    super.key,
    this.buttonText,
    required this.onPressed,
    this.backgroundColor,
    this.textStyle,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.kRadius100),
          ),
        ),
        backgroundColor: WidgetStatePropertyAll(backgroundColor ?? AppColors.primaryColor),
        padding: WidgetStateProperty.all(EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 16.h,
        )),
        fixedSize: WidgetStateProperty.all(Size(double.maxFinite, 60.h)),
      ),
      onPressed: onPressed,
      child: child ??
          Text(
            buttonText ?? '',
            style: textStyle ?? AppTextStyles.font18SemiBoldWhite,
          ),
    );
  }
}

class AppElevatedTextedButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final TextStyle? textStyle;

  const AppElevatedTextedButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: textStyle,
      ),
    );
  }
}
