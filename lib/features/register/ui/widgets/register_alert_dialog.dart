import 'package:flutter/material.dart';
import 'package:shipping_user_app/core/helpers/spacing.dart';
import 'package:shipping_user_app/core/routing/app_router.dart';
import 'package:shipping_user_app/core/theming/app_colors.dart';
import 'package:shipping_user_app/core/theming/app_text_styles.dart';
import 'package:shipping_user_app/generated/l10n.dart';

class RegisterAlertDialog extends StatelessWidget {
  final void Function() onConfirm;
  const RegisterAlertDialog({super.key, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      icon: const Icon(
        Icons.warning_amber_sharp,
        color: AppColors.primaryColor,
        size: 50,
      ),
      content: Text(
        S.of(context).warning_data_will_be_lost,
        style: AppTextStyles.font16Medium,
      ),

      actions: [
        TextButton(
          onPressed: () => goRouter.pop(),
          child: Text(
            S.of(context).cancel,
            style: AppTextStyles.font14Medium.copyWith(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
        const HorizontalSpace(10),
        TextButton(
          onPressed: onConfirm,
          child: Text(
            S.of(context).confirm,
            style: AppTextStyles.font14Medium.copyWith(color: AppColors.primaryColor),
          ),
        ),
      ],
    );
  }
}
