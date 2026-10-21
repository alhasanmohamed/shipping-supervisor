import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shipping_user_app/core/helpers/app_constants.dart';
import 'package:shipping_user_app/core/theming/app_colors.dart';
import 'package:shipping_user_app/core/theming/app_text_styles.dart';

class GeneralTextFormField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? showCursor;
  final String? labelText;
  final String? hintText;
  final TextInputType? textInputType;
  final bool? isPhoneNumber;
  final void Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final TextDirection? textDirection;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final void Function()? onTap;
  final bool? enableInteractiveSelection;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final Color? focusedBorderColor;
  final int? maxLines;
  final String? counterText;
  final int? maxLength;
  final bool? unFocusOnTapOutside;
  final Color? enabledBorderColor;
  final List<String>? autofillHints;
  final void Function(String)? onChanged;
  const GeneralTextFormField({
    super.key,
    required this.controller,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputType,
    this.isPhoneNumber,
    this.onFieldSubmitted,
    this.focusNode,
    this.textDirection,
    this.validator,
    this.textCapitalization,
    this.textInputAction,
    this.onTap,
    this.showCursor,
    this.enableInteractiveSelection,
    this.inputFormatters,
    this.enabled,
    this.hintText,
    this.focusedBorderColor,
    this.maxLines,
    this.counterText,
    this.maxLength,
    this.unFocusOnTapOutside = true,
    this.enabledBorderColor,
    this.autofillHints,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: focusedBorderColor ?? AppColors.primaryColor, width: 1.8),
          borderRadius: BorderRadius.all(Radius.circular(AppConstants.kRadius100)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: enabledBorderColor ?? AppColors.gray, width: 1.3),
          borderRadius: BorderRadius.all(Radius.circular(AppConstants.kRadius100)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.red, width: 1.8),
          borderRadius: BorderRadius.all(Radius.circular(AppConstants.kRadius100)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.red, width: 1.8),
          borderRadius: BorderRadius.all(Radius.circular(AppConstants.kRadius100)),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.gray.withValues(alpha: 0.5), width: 1.3),
          borderRadius: BorderRadius.all(Radius.circular(AppConstants.kRadius100)),
        ),
        labelStyle: TextStyle(
          fontSize: 14.sp,
        ),
        hintStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        fillColor: AppColors.transparent,
        filled: true,
        counterText: counterText,
      ),
      cursorColor: AppColors.primaryColor,
      style: AppTextStyles.font14SemiBold,
      keyboardType: textInputType,
      onFieldSubmitted: onFieldSubmitted,
      focusNode: focusNode,
      textDirection: textDirection,
      validator: validator,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      textInputAction: textInputAction,
      onTap: onTap,
      showCursor: showCursor,
      enableInteractiveSelection: enableInteractiveSelection,
      inputFormatters: inputFormatters,
      enabled: enabled,
      maxLines: maxLines,
      onTapOutside: (controller) {
        if (unFocusOnTapOutside == true) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      maxLength: maxLength,
      autofillHints: autofillHints,
      onChanged: onChanged,
    );
  }
}
