import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shipping_user_app/core/helpers/app_constants.dart';
import 'package:shipping_user_app/core/helpers/spacing.dart';
import 'package:shipping_user_app/core/routing/routes.dart';
import 'package:shipping_user_app/core/theming/app_colors.dart';
import 'package:shipping_user_app/core/theming/app_text_styles.dart';
import 'package:shipping_user_app/core/theming/custom_app_icons_icons.dart';
import 'package:shipping_user_app/core/widgets/app_text_button.dart';
import 'package:shipping_user_app/core/widgets/app_version_widget.dart';
import 'package:shipping_user_app/generated/l10n.dart';
import 'package:shipping_user_app/features/login/logic/login_cubit.dart';
import 'package:shipping_user_app/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:shipping_user_app/features/login/ui/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalSpace(10),
                  const Icon(
                    CustomAppIcons.logo,
                    size: 80,
                    color: AppColors.primaryColor,
                  ),
                  const VerticalSpace(10),
                  Text(
                    S.of(context).welcome,
                    style: AppTextStyles.font24SemiBold,
                  ),
                  const VerticalSpace(6),
                  Text(
                    S.of(context).enter_data,
                    style: AppTextStyles.font16SemiBoldGray,
                  ),
                  const VerticalSpace(40),
                  const LoginForm(),
                  const VerticalSpace(5),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: AppElevatedTextedButton(
                      buttonText: S.of(context).forgot_password,
                      textStyle: AppTextStyles.font14SemiBoldPrimary,
                      onPressed: () {},
                    ),
                  ),
                  const VerticalSpace(30),
                  AppTextButton(
                    buttonText: S.of(context).sign_in,
                    onPressed: () {
                      context.go(Routes.mainScreen);
                      loginCubit.validateLoginControllersDoLogin();
                    },
                  ),
                  const LoginBlocListener(),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: true,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: AppConstants.kVerticalPadding16),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${S.of(context).not_registered}  ',
                                style: AppTextStyles.font14SemiBold.copyWith(
                                  color: Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                              TextSpan(
                                text: S.of(context).sign_up_now,
                                style: AppTextStyles.font14SemiBoldPrimary,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => context.push(Routes.registerScreen),
                              ),
                            ],
                          ),
                        ),
                        const AppVersionWidget(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
