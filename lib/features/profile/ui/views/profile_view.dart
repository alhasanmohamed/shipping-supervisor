import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipping_user_app/core/theming/app_colors.dart';
import 'package:shipping_user_app/core/widgets/profile_image.dart';
import 'package:shipping_user_app/features/localization/logic/locale_cubit.dart';
import 'package:shipping_user_app/features/localization/ui/widgets/language_choose_sheet.dart';
import 'package:shipping_user_app/features/profile/logic/profile_cubit.dart';
import 'package:shipping_user_app/features/theme/ui/widgets/theme_choose_dialog.dart';
import 'package:shipping_user_app/core/theming/app_text_styles.dart';
import 'package:shipping_user_app/core/helpers/app_constants.dart';
import 'package:shipping_user_app/core/helpers/spacing.dart';
import 'package:shipping_user_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 80,
          ),
          children: [
            Align(
              alignment: Alignment.center,
              child: ProfileImage(
                link: context.read<ProfileCubit>().info.avatar ?? '',
                radius: 65,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor.withValues(alpha: 0.8),
                    shape: const CircleBorder(),
                  ),
                  onPressed: () {},
                  child: const Icon(
                    Icons.camera_alt_outlined,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            const VerticalSpace(10),
            Text(
              context.read<ProfileCubit>().info.name ?? '',
              textAlign: TextAlign.center,
              style: AppTextStyles.font20Bold,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            const VerticalSpace(40),
            ListTile(
              shape: Border(
                bottom: BorderSide(
                  color: Theme.of(context).dividerColor.withValues(alpha: 0.2),
                  width: 0.5,
                ),
              ),
              leading: const Icon(
                Icons.language,
              ),
              title: Text(
                S.of(context).language,
                style: AppTextStyles.font14Bold,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 5,
                children: [
                  Text(
                    context.read<LocaleCubit>().getLanguage().localeName,
                    style: AppTextStyles.font14SemiBoldPrimary,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                ],
              ),
              onTap: () => showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppConstants.kRadius25),
                    topRight: Radius.circular(AppConstants.kRadius25),
                  ),
                ),
                backgroundColor: Theme.of(context).dialogTheme.backgroundColor,
                showDragHandle: true,
                enableDrag: false,
                builder: (BuildContext context) => const LanguageChooseSheet(),
              ),
            ),
            ListTile(
              shape: Border(
                bottom: BorderSide(
                  color: Theme.of(context).dividerColor.withValues(alpha: 0.2),
                  width: 0.5,
                ),
              ),
              leading: Builder(
                builder: (context) {
                  if (Theme.of(context).brightness == Brightness.light) {
                    return const Icon(
                      Icons.light_mode,
                    );
                  } else {
                    return const Icon(
                      Icons.dark_mode,
                    );
                  }
                },
              ),
              title: Text(
                S.of(context).theme,
                style: AppTextStyles.font14Bold,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 5,
                children: [
                  Builder(
                    builder: (context) {
                      if (Theme.of(context).brightness == Brightness.light) {
                        return Text(
                          S.of(context).light_theme,
                          style: AppTextStyles.font14SemiBoldPrimary,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        );
                      } else {
                        return Text(
                          S.of(context).dark_theme,
                          style: AppTextStyles.font14SemiBoldPrimary,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        );
                      }
                    },
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                ],
              ),
              onTap: () => showAdaptiveDialog(
                context: context,
                builder: (BuildContext context) => const ThemeChooseDialog(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
