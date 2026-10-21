import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:shipping_user_app/core/helpers/show_snack_bar.dart';
import 'package:shipping_user_app/core/routing/routes.dart';
import 'package:shipping_user_app/core/theming/app_colors.dart';
import 'package:shipping_user_app/core/widgets/loading_widget.dart';
import 'package:shipping_user_app/generated/l10n.dart';
import 'package:shipping_user_app/features/register/logic/register_cubit.dart';
import 'package:shipping_user_app/features/register/logic/register_state.dart';

class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) =>
          current is RegisterLoading || current is RegisterSuccess || current is RegisterError,
      listener: (context, state) {
        state.whenOrNull(
          registerLoading: () => showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const LoadingWidget(),
          ),
          registerSuccess: (data) {
            context.pop();
            showSnackBar(
              context: context,
              title: S.of(context).success_registered,
              type: SnackBarType.success,
            );
            context.go(Routes.loginScreen);
          },
          registerError: (message) {
            context.pop();
            showAdaptiveDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Icon(
                  Icons.error,
                  color: AppColors.red,
                  size: 40.r,
                ),
                content: Text(message),
                actions: [
                  TextButton(
                    onPressed: context.pop,
                    child: Text(S.of(context).ok),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
