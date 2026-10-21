import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipping_user_app/core/helpers/app_constants.dart';
import 'package:shipping_user_app/core/helpers/extensions.dart';
import 'package:shipping_user_app/core/routing/app_router.dart';
import 'package:shipping_user_app/core/routing/routes.dart';
import 'package:shipping_user_app/core/theming/app_colors.dart';
import 'package:shipping_user_app/core/theming/app_text_styles.dart';
import 'package:shipping_user_app/features/register/logic/register_cubit.dart';
import 'package:shipping_user_app/features/register/ui/widgets/business_data_step_widget.dart';
import 'package:shipping_user_app/features/register/ui/widgets/licenses_step.dart';
import 'package:shipping_user_app/features/register/ui/widgets/personal_information_step_widget.dart';
import 'package:shipping_user_app/features/register/ui/widgets/register_alert_dialog.dart';
import 'package:shipping_user_app/generated/l10n.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int currentStep = 0;
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        didPop
            ? null
            : showDialog(
                context: context,
                builder: (context) => RegisterAlertDialog(
                  onConfirm: () {
                    goRouter.popUntil(Routes.loginScreen);
                  },
                ),
              );
      },
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).register_title,
            style: AppTextStyles.font24SemiBold,
          ),
          leading: IconButton(
            onPressed: () => showDialog(
              context: context,
              builder: (context) => RegisterAlertDialog(
                onConfirm: () {
                  goRouter.popUntil(Routes.loginScreen);
                },
              ),
            ),
            icon: Icon(
              Icons.adaptive.arrow_back,
              size: 24,
            ),
          ),
        ),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                child: StatefulBuilder(
                  builder: (context, setState) {
                    return Stepper(
                      type: StepperType.horizontal,
                      currentStep: currentStep,
                      onStepContinue: () {
                        final isLastStep = currentStep == 2;
                        if (isLastStep) {
                        } else {
                          setState(() => currentStep += 1);
                        }
                      },
                      onStepCancel: () {
                        if (currentStep > 0) {
                          setState(() => currentStep -= 1);
                        }
                      },
                      onStepTapped: null,
                      physics: const ClampingScrollPhysics(),
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.all(0),
                      elevation: 0,
                      stepIconMargin: const EdgeInsets.all(4),
                      controlsBuilder: buildControls,
                      steps: [
                        Step(
                          isActive: currentStep >= 0,
                          state: getStepState(currentStep, 0),
                          title: Text(
                            S.of(context).personal_information,
                            style: AppTextStyles.font12Medium.copyWith(
                              fontSize: 12,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          content: const PersonalInformationStepWidget(),
                          stepStyle: StepStyle(
                            color: currentStep >= 0 ? AppColors.primaryColor : AppColors.gray,
                          ),
                        ),
                        Step(
                          isActive: currentStep >= 1,
                          state: getStepState(currentStep, 1),
                          title: Text(
                            S.of(context).licences,
                            style: AppTextStyles.font12Medium.copyWith(
                              fontSize: 12,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          content: const LicensesStep(),
                          stepStyle: StepStyle(
                            color: currentStep >= 1 ? AppColors.primaryColor : AppColors.gray,
                          ),
                        ),
                        Step(
                          isActive: currentStep >= 2,
                          state: getStepState(currentStep, 2),
                          title: Text(
                            S.of(context).business_data,
                            style: AppTextStyles.font12Medium.copyWith(
                              fontSize: 12,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          content: const BusinessDataStepWidget(),
                          stepStyle: StepStyle(
                            color: currentStep >= 2 ? AppColors.primaryColor : AppColors.gray,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  StepState getStepState(int currentStep, int stepIndex) {
    if (currentStep == stepIndex) {
      return StepState.editing;
    } else if (currentStep > stepIndex) {
      return StepState.complete;
    } else {
      return StepState.indexed;
    }
  }

  Widget buildControls(BuildContext context, ControlsDetails details) {
    return switch (details.currentStep) {
      0 => Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Row(
            spacing: 10,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppConstants.kRadius100),
                  ),
                ),
                onPressed: () {
                  if (context
                      .read<RegisterCubit>()
                      .personalInformationKey
                      .currentState!
                      .validate()) {
                    details.onStepContinue!();
                  }
                },
                child: Text(
                  S.of(context).next,
                  style: AppTextStyles.font14SemiBold.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      1 => Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Row(
            spacing: 10,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppConstants.kRadius100),
                  ),
                ),
                onPressed: () {
                  if (context.read<RegisterCubit>().licencesKey.currentState!.validate()) {
                    details.onStepContinue!();
                  }
                },
                child: Text(
                  S.of(context).next,
                  style: AppTextStyles.font14SemiBold.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: AppColors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppConstants.kRadius100),
                    side: const BorderSide(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                onPressed: details.onStepCancel,
                child: Text(
                  S.of(context).back,
                  style: AppTextStyles.font14SemiBold.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      2 => Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Row(
            spacing: 10,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: AppColors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppConstants.kRadius100),
                    side: const BorderSide(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                onPressed: details.onStepCancel,
                child: Text(
                  S.of(context).back,
                  style: AppTextStyles.font14SemiBold.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      int() => const SizedBox.shrink(),
    };
  }
}
