import 'package:flutter/material.dart';
import 'package:shipping_user_app/core/theming/app_colors.dart';
import 'package:shipping_user_app/core/theming/app_text_styles.dart';
import 'package:shipping_user_app/core/widgets/app_text_button.dart';
import 'package:shipping_user_app/core/helpers/app_constants.dart';

void showSingleChoiceDialog(
  context, {
  required Icon icon,
  required String title,
  required String content,
  required String buttonText,
  required VoidCallback onPressed,
}) =>
    showAdaptiveDialog(
      context: context,
      builder: (context) => AlertDialog.adaptive(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppConstants.kRadius8),
          ),
        ),
        elevation: 0,
        title: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: icon,
            ),
            Text(
              title,
              style: AppTextStyles.font18Bold,
            ),
          ],
        ),
        content: Text(
          content,
          style: AppTextStyles.font14Medium,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          AppElevatedTextedButton(
            buttonText: buttonText,
            onPressed: onPressed,
            textStyle: AppTextStyles.font16SemiBold.copyWith(
              color: AppColors.primaryColor,
            ),
          )
        ],
      ),
    );
