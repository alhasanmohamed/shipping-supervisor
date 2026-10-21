import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipping_user_app/core/helpers/app_constants.dart';
import 'package:shipping_user_app/core/theming/app_colors.dart';
import 'package:shipping_user_app/core/theming/app_text_styles.dart';

class CustomDropDownFormField extends StatelessWidget {
  final TextEditingController controller;
  final List<DropdownMenuEntry> dropdownMenuEntries;
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final Color? focusedBorderColor;
  final Color? enabledBorderColor;
  const CustomDropDownFormField({
    super.key,
    required this.controller,
    required this.dropdownMenuEntries,
    this.labelText,
    this.hintText,
    this.validator,
    this.focusedBorderColor,
    this.enabledBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      expandedInsets: EdgeInsets.zero,
      controller: controller,
      hintText: hintText,
      label: Text(
        labelText ?? '',
        style: TextStyle(
          fontSize: 14.sp,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
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
        helperStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        fillColor: AppColors.transparent,
        filled: true,
        isCollapsed: true,
      ),
      alignmentOffset: const Offset(0, 5),
      textAlign: TextAlign.start,
      menuStyle: MenuStyle(
        backgroundColor: WidgetStatePropertyAll(Theme.of(context).dialogTheme.backgroundColor),
        elevation: const WidgetStatePropertyAll(5),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppConstants.kRadius20)),
            side: const BorderSide(color: AppColors.primaryColor70, width: 1.3),
          ),
        ),
        padding: const WidgetStatePropertyAll(EdgeInsets.zero),
      ),
      textStyle: AppTextStyles.font14SemiBold,
      onSelected: (value) {
        log(controller.text);
      },
      dropdownMenuEntries: dropdownMenuEntries,
    );
  }
}
