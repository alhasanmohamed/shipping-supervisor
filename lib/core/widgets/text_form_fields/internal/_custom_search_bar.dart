import 'package:flutter/material.dart';
import 'package:shipping_user_app/core/helpers/app_constants.dart';
import 'package:shipping_user_app/core/theming/app_colors.dart';
import 'package:shipping_user_app/core/theming/app_text_styles.dart';
import 'package:shipping_user_app/generated/l10n.dart';

class CustomSearchBar extends StatelessWidget {
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? leading;
  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;
  const CustomSearchBar({
    super.key,
    this.hintText,
    this.hintStyle,
    this.leading,
    this.onSubmitted,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: hintText ?? S.of(context).search,
      hintStyle: WidgetStatePropertyAll(
        hintStyle ?? AppTextStyles.font14SemiBoldGray,
      ),
      elevation: const WidgetStatePropertyAll(1),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppConstants.kRadius100)),
          side: const BorderSide(
            color: AppColors.secondGray,
          ),
        ),
      ),
      padding: WidgetStatePropertyAll(
        EdgeInsets.symmetric(
          horizontal: AppConstants.kHorizontalPadding10,
        ),
      ),
      leading: leading ??
          const Icon(
            Icons.search,
            size: 25,
            color: AppColors.gray,
          ),
      textInputAction: TextInputAction.search,
      keyboardType: TextInputType.text,
      onSubmitted: onSubmitted,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onChanged: onChanged,
      overlayColor: const WidgetStatePropertyAll(AppColors.transparent),
    );
  }
}
