import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipping_user_app/core/helpers/spacing.dart';
import 'package:shipping_user_app/core/helpers/text_editing_validator.dart';
import 'package:shipping_user_app/core/theming/app_colors.dart';
import 'package:shipping_user_app/core/theming/app_text_styles.dart';
import 'package:shipping_user_app/core/widgets/text_form_fields/app_text_form_fields.dart';
import 'package:shipping_user_app/features/register/logic/register_cubit.dart';
import 'package:shipping_user_app/generated/l10n.dart';

class PersonalInformationStepWidget extends StatelessWidget {
  const PersonalInformationStepWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.read<RegisterCubit>();
    return Form(
      key: registerCubit.personalInformationKey,
      child: Column(
        children: [
          const VerticalSpace(5),
          GeneralTextFormField(
            controller: registerCubit.nameController,
            validator: TextEditingValidator.validateName,
            labelText: S.of(context).name,
            textInputAction: TextInputAction.done,
          ),
          const VerticalSpace(25),
          StatefulBuilder(
            builder: (context, setState) {
              return GeneralTextFormField(
                controller: registerCubit.dateOfBirthController,
                validator: TextEditingValidator.validateEmptyField,
                textInputType: TextInputType.none,
                textInputAction: TextInputAction.next,
                hintText: S.of(context).date_of_birth,
                labelText: S.of(context).age,
                enableInteractiveSelection: false,
                showCursor: false,
                suffixIcon: Icon(
                  Icons.calendar_month_outlined,
                  color: AppColors.gray,
                  size: 25.r,
                ),
                onTap: () => showDatePicker(
                  context: context,
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                ).then((pickedDate) {
                  if (pickedDate != null) {
                    setState(() {
                      registerCubit.dateOfBirthController.text =
                          (DateTime.now().difference(pickedDate).inDays / 365.25)
                              .toInt()
                              .toString();
                      FocusScope.of(context).nextFocus();
                    });
                  }
                }),
              );
            },
          ),
          const VerticalSpace(25),
          GeneralTextFormField(
            controller: registerCubit.medicalInsuranceController,
            validator: TextEditingValidator.validateEmptyField,
            labelText: S.of(context).medical_insurance_number,
            textInputAction: TextInputAction.next,
          ),
          const VerticalSpace(25),
          InputDecorator(
            decoration: InputDecoration(
                label: Text(
                  S.of(context).login_information,
                  style: AppTextStyles.font14SemiBoldPrimary,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(26),
                  borderSide: BorderSide(
                    color: Colors.grey.withValues(alpha: 0.5),
                  ),
                )),
            child: Column(
              children: [
                const VerticalSpace(10),
                AppPhoneTextFormField(
                  phoneController: registerCubit.phoneController,
                  phoneCodeController: registerCubit.countryCodeController,
                  initialCountryCode: 'SA',
                  validator: TextEditingValidator.validateEmptyField,
                  labelText: S.of(context).phone,
                  textInputAction: TextInputAction.next,
                ),
                const VerticalSpace(25),
                GeneralTextFormField(
                  controller: registerCubit.emailController,
                  validator: TextEditingValidator.validateEmail,
                  labelText: S.of(context).email,
                  textInputAction: TextInputAction.next,
                ),
                const VerticalSpace(25),
                AppPasswordTextFormField(
                  controller: registerCubit.passwordController,
                  labelText: S.of(context).password,
                  validator: TextEditingValidator.validatePassword,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (p0) => FocusScope.of(context).nextFocus(),
                ),
                const VerticalSpace(25),
                AppPasswordTextFormField(
                  controller: registerCubit.confirmPasswordController,
                  labelText: S.of(context).confirm_password,
                  validator: (value) => TextEditingValidator.validateConfirmPassword(
                    value,
                    registerCubit.passwordController.text,
                  ),
                  textInputAction: TextInputAction.done,
                ),
                const VerticalSpace(10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
