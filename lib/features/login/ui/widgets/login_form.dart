import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipping_user_app/core/helpers/spacing.dart';
import 'package:shipping_user_app/core/helpers/text_editing_validator.dart';
import 'package:shipping_user_app/core/widgets/text_form_fields/app_text_form_fields.dart';
import 'package:shipping_user_app/generated/l10n.dart';
import 'package:shipping_user_app/features/login/logic/login_cubit.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();
    return Form(
      key: context.read<LoginCubit>().loginFormKey,
      child: AutofillGroup(
        child: Column(
          children: [
            GeneralTextFormField(
              controller: loginCubit.emailController,
              validator: TextEditingValidator.validateEmail,
              labelText: '${S.of(context).email} / ${S.of(context).phone}',
              textInputAction: TextInputAction.next,
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp(r'\s')),
              ],
              autofillHints: const [
                AutofillHints.email,
                AutofillHints.username,
              ],
            ),
            const VerticalSpace(25),
            AppPasswordTextFormField(
              controller: loginCubit.passwordController,
              labelText: S.of(context).password,
              validator: TextEditingValidator.validatePassword,
              textInputAction: TextInputAction.done,
              autofillHints: const [
                AutofillHints.password,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
