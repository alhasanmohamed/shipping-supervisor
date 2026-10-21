import 'package:shipping_user_app/features/theme/logic/theme_cubit.dart';
import 'package:shipping_user_app/core/theming/app_text_styles.dart';
import 'package:shipping_user_app/core/helpers/app_constants.dart';
import 'package:shipping_user_app/core/routing/app_router.dart';
import 'package:shipping_user_app/core/theming/app_colors.dart';
import 'package:shipping_user_app/core/helpers/spacing.dart';
import 'package:shipping_user_app/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ThemeChooseDialog extends StatelessWidget {
  const ThemeChooseDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();
    ThemeMode currentTheme = themeCubit.getTheme();
    return SafeArea(
      child: AlertDialog(
        title: Text(
          S.of(context).choose_theme,
          style: AppTextStyles.font16Bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.kRadius10),
        ),
        content: StatefulBuilder(
          builder: (context, setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RadioListTile.adaptive(
                  title: Text(
                    S.of(context).default_system_theme,
                    style: AppTextStyles.font12Bold,
                  ),
                  value: ThemeMode.system,
                  groupValue: currentTheme,
                  selected: currentTheme == ThemeMode.system,
                  dense: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppConstants.kRadius10),
                  ),
                  selectedTileColor: AppColors.primaryColor.withValues(alpha: 0.1),
                  activeColor: AppColors.primaryColor,
                  onChanged: (value) => setState(() => currentTheme = value!),
                ),
                const VerticalSpace(10),
                RadioListTile.adaptive(
                  title: Text(
                    S.of(context).light_theme,
                    style: AppTextStyles.font12Bold,
                  ),
                  value: ThemeMode.light,
                  groupValue: currentTheme,
                  selected: currentTheme == ThemeMode.light,
                  dense: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppConstants.kRadius10),
                  ),
                  selectedTileColor: AppColors.primaryColor.withValues(alpha: 0.1),
                  activeColor: AppColors.primaryColor,
                  onChanged: (value) => setState(() => currentTheme = value!),
                ),
                const VerticalSpace(10),
                RadioListTile.adaptive(
                  title: Text(
                    S.of(context).dark_theme,
                    style: AppTextStyles.font12Bold,
                  ),
                  value: ThemeMode.dark,
                  groupValue: currentTheme,
                  selected: currentTheme == ThemeMode.dark,
                  dense: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppConstants.kRadius10),
                  ),
                  selectedTileColor: AppColors.primaryColor.withValues(alpha: 0.1),
                  activeColor: AppColors.primaryColor,
                  onChanged: (value) => setState(() => currentTheme = value!),
                ),
              ],
            );
          },
        ),
        actionsPadding: const EdgeInsets.all(8),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        actions: [
          TextButton(
            onPressed: goRouter.pop,
            child: Text(
              S.of(context).cancel,
              style: AppTextStyles.font12SemiBold.copyWith(color: AppColors.primaryColor),
            ),
          ),
          TextButton(
            onPressed: () {
              themeCubit.changeTheme(currentTheme);
              goRouter.pop();
            },
            child: Text(
              S.of(context).confirm,
              style: AppTextStyles.font12SemiBold.copyWith(color: AppColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
