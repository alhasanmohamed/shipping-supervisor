import 'package:shipping_user_app/features/localization/logic/locale_cubit.dart';
import 'package:shipping_user_app/core/theming/app_text_styles.dart';
import 'package:shipping_user_app/core/helpers/app_constants.dart';
import 'package:shipping_user_app/core/routing/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class LanguageChooseSheet extends StatelessWidget {
  const LanguageChooseSheet({super.key});
  @override
  Widget build(BuildContext context) {
    final languageCubit = context.read<LocaleCubit>();
    return SafeArea(
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.only(
          bottom: AppConstants.kVerticalPadding8,
        ),
        itemCount: languageCubit.languages.length,
        itemBuilder: (context, index) => RadioListTile.adaptive(
          title: Text(
            languageCubit.languages[index].localeName,
            style: AppTextStyles.font14Bold,
          ),
          value: languageCubit.languages[index].languageCode,
          groupValue: languageCubit.state.languageCode,
          onChanged: (value) async {
            goRouter.pop();
            await Future.delayed(const Duration(milliseconds: 200), () {
              languageCubit.changeLanguage(languageCubit.languages[index]);
            });
          },
        ),
      ),
    );
  }
}
