import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shipping_user_app/core/helpers/app_constants.dart';
import 'package:shipping_user_app/core/theming/app_colors.dart';
import 'package:shipping_user_app/core/theming/app_text_styles.dart';

class AppPasswordTextFormField extends StatefulWidget {
  final void Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final String labelText;
  final TextDirection? textDirection;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final TextInputAction? textInputAction;
  final bool? unFocusOnTapOutside;
  final List<String>? autofillHints;
  const AppPasswordTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.onFieldSubmitted,
    this.focusNode,
    this.textDirection,
    this.validator,
    this.textInputAction,
    this.unFocusOnTapOutside = true,
    this.autofillHints,
  });

  @override
  State<AppPasswordTextFormField> createState() => _AppPasswordTextFormFieldState();
}

class _AppPasswordTextFormFieldState extends State<AppPasswordTextFormField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.8),
          borderRadius: BorderRadius.all(Radius.circular(AppConstants.kRadius100)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.gray, width: 1.3),
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
        labelStyle: TextStyle(fontSize: 14.sp),
        labelText: widget.labelText,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isObscure = !isObscure;
            });
          },
          icon: Icon(
            isObscure == true ? Icons.visibility_off : Icons.visibility,
            color: AppColors.gray,
            size: 25.r,
          ),
        ),
        fillColor: AppColors.transparent,
        filled: true,
      ),
      cursorColor: AppColors.primaryColor,
      obscureText: isObscure,
      style: AppTextStyles.font14SemiBold,
      keyboardType: TextInputType.visiblePassword,
      focusNode: widget.focusNode,
      onFieldSubmitted: widget.onFieldSubmitted,
      textDirection: widget.textDirection,
      validator: widget.validator,
      textInputAction: widget.textInputAction,
      onTapOutside: (controller) {
        if (widget.unFocusOnTapOutside == true) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(r'\s')),
      ],
      autofillHints: widget.autofillHints,
    );
  }
}
