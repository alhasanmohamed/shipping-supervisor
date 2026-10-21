import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shipping_user_app/core/helpers/extensions.dart';
import 'package:shipping_user_app/core/helpers/show_snack_bar.dart';
import 'package:shipping_user_app/core/helpers/show_toast.dart';
import 'package:shipping_user_app/core/helpers/spacing.dart';
import 'package:shipping_user_app/core/helpers/text_editing_validator.dart';
import 'package:shipping_user_app/core/routing/app_router.dart';
import 'package:shipping_user_app/core/routing/routes.dart';
import 'package:shipping_user_app/core/theming/app_colors.dart';
import 'package:shipping_user_app/core/theming/app_text_styles.dart';
import 'package:shipping_user_app/core/widgets/app_text_button.dart';
import 'package:shipping_user_app/core/widgets/text_form_fields/app_text_form_fields.dart';
import 'package:shipping_user_app/features/profile/logic/profile_cubit.dart';
import 'package:shipping_user_app/features/profile/logic/profile_state.dart';
import 'package:shipping_user_app/features/register/logic/register_cubit.dart';
import 'package:shipping_user_app/features/register/ui/widgets/register_bloc_listener.dart';
import 'package:shipping_user_app/generated/l10n.dart';

class BusinessDataStepWidget extends StatelessWidget {
  const BusinessDataStepWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.read<RegisterCubit>();
    final double kMaxAttachmentSize = 2.0;
    final int kImageQuality = 70;
    List<String> options = ['one', 'two', 'three', 'four', 'five'];
    return StatefulBuilder(builder: (context, setState) {
      return Form(
        key: registerCubit.businessDataKey,
        child: Column(
          children: [
            const VerticalSpace(5),
            CustomDropDownFormField(
              controller: registerCubit.regionController,
              validator: TextEditingValidator.validateEmptyField,
              hintText: S.of(context).select_region,
              labelText: S.of(context).region,
              dropdownMenuEntries: [
                DropdownMenuEntry(
                  value: options[0],
                  label: options[0],
                ),
                DropdownMenuEntry(
                  value: options[1],
                  label: options[1],
                ),
                DropdownMenuEntry(
                  value: options[2],
                  label: options[2],
                ),
                DropdownMenuEntry(
                  value: options[3],
                  label: options[3],
                ),
                DropdownMenuEntry(
                  value: options[4],
                  label: options[4],
                ),
              ],
            ),
            const VerticalSpace(25),
            CustomDropDownFormField(
              controller: registerCubit.providerController,
              validator: TextEditingValidator.validateEmptyField,
              hintText: S.of(context).select_provider,
              labelText: S.of(context).provider,
              dropdownMenuEntries: [
                DropdownMenuEntry(
                  value: options[0],
                  label: options[0],
                ),
                DropdownMenuEntry(
                  value: options[1],
                  label: options[1],
                ),
                DropdownMenuEntry(
                  value: options[2],
                  label: options[2],
                ),
                DropdownMenuEntry(
                  value: options[3],
                  label: options[3],
                ),
                DropdownMenuEntry(
                  value: options[4],
                  label: options[4],
                ),
              ],
            ),
            const VerticalSpace(25),
            GeneralTextFormField(
              controller: registerCubit.drivingLicenseIdController,
              validator: TextEditingValidator.validateEmptyField,
              labelText: S.of(context).driving_license_number,
              textInputAction: TextInputAction.done,
            ),
            const VerticalSpace(25),
            GeneralTextFormField(
              controller: registerCubit.drivingLicenseIdImageController,
              validator: TextEditingValidator.validateEmptyField,
              textInputType: TextInputType.none,
              textInputAction: TextInputAction.done,
              hintText: S.of(context).driving_license_image,
              labelText: S.of(context).driving_license_image,
              enableInteractiveSelection: false,
              showCursor: false,
              counterText: S.of(context).max_size(kMaxAttachmentSize),
              suffixIcon: Icon(
                Icons.badge_outlined,
                color: AppColors.gray,
                size: 25.r,
              ),
              onTap: () async {
                await ImagePicker()
                    .pickImage(source: ImageSource.gallery, imageQuality: kImageQuality)
                    .then(
                  (value) async {
                    if (value != null) {
                      int fullSize = await value.length();
                      if (fullSize.toDouble().toMb() > kMaxAttachmentSize) {
                        if (context.mounted) {
                          showToast(
                            context,
                            message: S.of(context).max_image_size(kMaxAttachmentSize),
                            backgroundColor: Theme.of(context).colorScheme.error,
                          );
                        }
                        value = null;
                        return;
                      } else {
                        setState(
                          () {
                            registerCubit.drivingLicenseIdImage = value;
                            registerCubit.drivingLicenseIdImageController.text =
                                'driving_license_image.${registerCubit.drivingLicenseIdImage?.path.split('.').last}';
                          },
                        );
                      }
                    }
                  },
                );
              },
            ),
            const VerticalSpace(25),
            GeneralTextFormField(
              controller: registerCubit.plateNumberController,
              validator: TextEditingValidator.validateEmptyField,
              labelText: S.of(context).vehicle_plate_number,
              textInputAction: TextInputAction.done,
            ),
            const VerticalSpace(25),
            GeneralTextFormField(
              controller: registerCubit.plateImageController,
              validator: TextEditingValidator.validateEmptyField,
              textInputType: TextInputType.none,
              textInputAction: TextInputAction.done,
              hintText: S.of(context).vehicle_plate_image,
              labelText: S.of(context).vehicle_plate_image,
              enableInteractiveSelection: false,
              showCursor: false,
              counterText: S.of(context).max_size(kMaxAttachmentSize),
              suffixIcon: Icon(
                Icons.garage_outlined,
                color: AppColors.gray,
                size: 25.r,
              ),
              onTap: () async {
                await ImagePicker()
                    .pickImage(source: ImageSource.gallery, imageQuality: kImageQuality)
                    .then(
                  (value) async {
                    if (value != null) {
                      int fullSize = await value.length();
                      if (fullSize.toDouble().toMb() > kMaxAttachmentSize) {
                        if (context.mounted) {
                          showToast(
                            context,
                            message: S.of(context).max_image_size(kMaxAttachmentSize),
                            backgroundColor: Theme.of(context).colorScheme.error,
                          );
                        }
                        value = null;
                        return;
                      } else {
                        setState(
                          () {
                            registerCubit.plateImage = value;
                            registerCubit.plateImageController.text =
                                'plate_image.${registerCubit.plateImage?.path.split('.').last}';
                          },
                        );
                      }
                    }
                  },
                );
              },
            ),
            const VerticalSpace(25),
            GeneralTextFormField(
              controller: registerCubit.guaranteeDocumentImageController,
              validator: TextEditingValidator.validateEmptyField,
              textInputType: TextInputType.none,
              textInputAction: TextInputAction.done,
              hintText: S.of(context).guarantee_document_image,
              labelText: S.of(context).guarantee_document_image,
              enableInteractiveSelection: false,
              showCursor: false,
              counterText: S.of(context).max_size(kMaxAttachmentSize),
              suffixIcon: Icon(
                Icons.insert_page_break_outlined,
                color: AppColors.gray,
                size: 25.r,
              ),
              onTap: () async {
                await ImagePicker()
                    .pickImage(source: ImageSource.gallery, imageQuality: kImageQuality)
                    .then(
                  (value) async {
                    if (value != null) {
                      int fullSize = await value.length();
                      if (fullSize.toDouble().toMb() > kMaxAttachmentSize) {
                        if (context.mounted) {
                          showToast(
                            context,
                            message: S.of(context).max_image_size(kMaxAttachmentSize),
                            backgroundColor: Theme.of(context).colorScheme.error,
                          );
                        }
                        value = null;
                        return;
                      } else {
                        setState(
                          () {
                            registerCubit.guaranteeDocumentImage = value;
                            registerCubit.guaranteeDocumentImageController.text =
                                'guarantee_document_image.${registerCubit.guaranteeDocumentImage?.path.split('.').last}';
                          },
                        );
                      }
                    }
                  },
                );
              },
            ),
            const VerticalSpace(25),
            StatefulBuilder(
              builder: (context, setState) {
                return Row(
                  children: [
                    Checkbox(
                      value: registerCubit.isTermsAndConditionsSelected,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onChanged: (value) {
                        setState(() {
                          registerCubit.isTermsAndConditionsSelected = value!;
                        });
                      },
                      visualDensity: VisualDensity.compact,
                    ),
                    BlocBuilder<ProfileCubit, ProfileState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse: () => RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '${S.of(context).accept_on}  ',
                                  style: AppTextStyles.font14SemiBold.copyWith(
                                    color: Theme.of(context).colorScheme.onPrimary,
                                  ),
                                ),
                                TextSpan(
                                  text: S.of(context).terms_and_conditions,
                                  style: AppTextStyles.font14SemiBoldPrimary,
                                ),
                              ],
                            ),
                          ),
                          getPoliciesDocumentsSuccess: () {
                            final policiesDocument =
                                context.read<ProfileCubit>().policiesDocs.firstWhere(
                                      (element) => element.type == 'terms_and_conditions',
                                    );
                            return RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '${S.of(context).accept_on}  ',
                                    style: AppTextStyles.font14SemiBold.copyWith(
                                      color: Theme.of(context).colorScheme.onPrimary,
                                    ),
                                  ),
                                  TextSpan(
                                    text: S.of(context).terms_and_conditions,
                                    style: AppTextStyles.font14SemiBoldPrimary,
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        goRouter.push(
                                          Routes.policiesScreen,
                                          extra: policiesDocument,
                                        );
                                      },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                );
              },
            ),

            /// Sign Up button
            const VerticalSpace(30),
            AppTextButton(
              buttonText: S.of(context).sign_up,
              onPressed: () {
                if (registerCubit.isTermsAndConditionsSelected) {
                  registerCubit.validateForms();
                  showToast(
                    context,
                    message: 'Successfully registered',
                    backgroundColor: AppColors.green,
                  );
                } else {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  showSnackBar(
                    context: context,
                    title: S.of(context).error_terms_conditions,
                    type: SnackBarType.error,
                  );
                }
              },
            ),
            const VerticalSpace(20),
            const RegisterBlocListener(),
          ],
        ),
      );
    });
  }
}
