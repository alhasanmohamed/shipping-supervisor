import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shipping_user_app/core/helpers/country_code_to_flag.dart';
import 'package:shipping_user_app/core/helpers/extensions.dart';
import 'package:shipping_user_app/core/helpers/show_toast.dart';
import 'package:shipping_user_app/core/helpers/spacing.dart';
import 'package:shipping_user_app/core/helpers/text_editing_validator.dart';
import 'package:shipping_user_app/core/theming/app_colors.dart';
import 'package:shipping_user_app/core/widgets/nationality_dialog.dart';
import 'package:shipping_user_app/core/widgets/text_form_fields/app_text_form_fields.dart';
import 'package:shipping_user_app/features/register/logic/register_cubit.dart';
import 'package:shipping_user_app/generated/l10n.dart';

class LicensesStep extends StatelessWidget {
  const LicensesStep({super.key});

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.read<RegisterCubit>();
    final double kMaxAttachmentSize = 2.0;
    final int kImageQuality = 70;
    return StatefulBuilder(builder: (context, setState) {
      return Form(
        key: registerCubit.licencesKey,
        child: Column(
          children: [
            const VerticalSpace(5),
            GeneralTextFormField(
              controller: registerCubit.nationalityController,
              validator: TextEditingValidator.validateEmptyField,
              textInputType: TextInputType.none,
              textInputAction: TextInputAction.done,
              hintText: S.of(context).nationality,
              labelText: S.of(context).nationality,
              enableInteractiveSelection: false,
              showCursor: false,
              suffixIcon: Builder(
                builder: (context) {
                  if (registerCubit.country != null) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.only(end: 6),
                          child: Text(
                            countryCodeToEmoji(registerCubit.country?.countryCode),
                            style: const TextStyle(
                              fontSize: 24,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Icon(
                      Icons.flag,
                      color: AppColors.gray,
                      size: 25.r,
                    );
                  }
                },
              ),
              onTap: () => showAdaptiveDialog(
                context: context,
                builder: (context) => NationalityDialog(
                  onCountrySelected: (selectedCountry) {
                    setState(() {
                      registerCubit.passportImage = null;
                      registerCubit.iDOrIqamaImage = null;
                      registerCubit.iDOrIqamaNumberController.clear();
                      registerCubit.iDOrIqamaImageController.clear();
                      registerCubit.passportNumberController.clear();
                      registerCubit.passportImageController.clear();
                      registerCubit.country = selectedCountry;
                      registerCubit.nationalityController.text = selectedCountry.countryName!;
                    });
                  },
                ),
              ),
            ),
            const VerticalSpace(25),
            if (registerCubit.country?.countryCode == 'SA') ...[
              GeneralTextFormField(
                controller: registerCubit.iDOrIqamaNumberController,
                validator: TextEditingValidator.validateEmptyField,
                labelText: S.of(context).id_number,
                textInputAction: TextInputAction.done,
              ),
              const VerticalSpace(25),
              GeneralTextFormField(
                controller: registerCubit.iDOrIqamaImageController,
                validator: TextEditingValidator.validateEmptyField,
                textInputType: TextInputType.none,
                textInputAction: TextInputAction.done,
                hintText: S.of(context).id_image,
                labelText: S.of(context).id_image,
                enableInteractiveSelection: false,
                showCursor: false,
                counterText: S.of(context).max_size(kMaxAttachmentSize),
                suffixIcon: Icon(
                  Icons.badge_outlined,
                  color: AppColors.gray,
                  size: 25.r,
                ),
                onTap: () async {
                  await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: kImageQuality).then(
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
                              registerCubit.iDOrIqamaImage = value;
                              registerCubit.iDOrIqamaImageController.text =
                                  'user_id_image.${registerCubit.iDOrIqamaImage?.path.split('.').last}';
                            },
                          );
                        }
                      }
                    },
                  );
                },
              ),
            ],
            if (registerCubit.country != null && registerCubit.country?.countryCode != 'SA') ...[
              GeneralTextFormField(
                controller: registerCubit.iDOrIqamaNumberController,
                validator: TextEditingValidator.validateEmptyField,
                labelText: S.of(context).iqama_number,
                textInputAction: TextInputAction.done,
              ),
              const VerticalSpace(25),
              GeneralTextFormField(
                controller: registerCubit.iDOrIqamaImageController,
                validator: TextEditingValidator.validateEmptyField,
                textInputType: TextInputType.none,
                textInputAction: TextInputAction.done,
                hintText: S.of(context).iqama_image,
                labelText: S.of(context).iqama_image,
                enableInteractiveSelection: false,
                showCursor: false,
                counterText: S.of(context).max_size(kMaxAttachmentSize),
                suffixIcon: Icon(
                  Icons.badge_outlined,
                  color: AppColors.gray,
                  size: 25.r,
                ),
                onTap: () async {
                  await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: kImageQuality).then(
                    (value) async {
                      if (value != null) {
                        List<int> fullSize = await value.readAsBytes();
                        if (fullSize.length.toDouble().toMb() > kMaxAttachmentSize) {
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
                              registerCubit.iDOrIqamaImage = value;
                              registerCubit.iDOrIqamaImageController.text =
                                  'user_iqama_image.${registerCubit.iDOrIqamaImage?.path.split('.').last}';
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
                controller: registerCubit.passportNumberController,
                labelText: S.of(context).passport_number,
                textInputAction: TextInputAction.done,
              ),
              const VerticalSpace(25),
              GeneralTextFormField(
                controller: registerCubit.passportImageController,
                validator: TextEditingValidator.validateEmptyField,
                textInputType: TextInputType.none,
                textInputAction: TextInputAction.done,
                hintText: S.of(context).passport_image,
                labelText: S.of(context).passport_image,
                enableInteractiveSelection: false,
                showCursor: false,
                counterText: S.of(context).max_size(kMaxAttachmentSize),
                suffixIcon: Icon(
                  Icons.badge_outlined,
                  color: AppColors.gray,
                  size: 25.r,
                ),
                onTap: () async {
                  await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: kImageQuality).then(
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
                              registerCubit.passportImage = value;
                              registerCubit.passportImageController.text =
                                  'user_passport_image.${registerCubit.passportImage?.path.split('.').last}';
                            },
                          );
                        }
                      }
                    },
                  );
                },
              ),
            ],
          ],
        ),
      );
    });
  }
}
