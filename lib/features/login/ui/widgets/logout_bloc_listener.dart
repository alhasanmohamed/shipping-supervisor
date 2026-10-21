import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shipping_user_app/core/helpers/show_snack_bar.dart';
import 'package:shipping_user_app/core/routing/routes.dart';
import 'package:shipping_user_app/core/widgets/loading_widget.dart';
import 'package:shipping_user_app/features/login/logic/login_cubit.dart';
import 'package:shipping_user_app/features/login/logic/login_state.dart';

class LogoutBlocListener extends StatelessWidget {
  const LogoutBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LogoutLoading ||
          current is LogoutSuccess ||
          current is LogoutError,
      listener: (context, state) {
        state.whenOrNull(
          logoutLoading: () {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => const LoadingWidget(),
            );
          },
          logoutSuccess: () {
            context.pop();
            context.go(Routes.loginScreen);
          },
          logoutError: (error) {
            context.pop();
            ScaffoldMessenger.of(context).clearSnackBars();
            showSnackBar(
              context: context,
              title: error,
              type: SnackBarType.error,
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
