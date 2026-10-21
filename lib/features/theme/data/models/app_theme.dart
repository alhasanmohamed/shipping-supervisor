import 'package:shipping_user_app/core/theming/app_text_styles.dart';
import 'package:shipping_user_app/core/helpers/app_constants.dart';
import 'package:shipping_user_app/core/theming/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    fontFamily: AppConstants.kMainFont,
    scaffoldBackgroundColor: AppColors.backgroundColorLight,
    disabledColor: AppColors.gray,
    colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      primary: AppColors.primaryColor,
      secondary: AppColors.primaryColor.withValues(alpha: 0.3),
      onPrimary: AppColors.black,
      shadow: AppColors.secondGray,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundColorLight,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.black,
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      dragHandleColor: AppColors.gray,
      backgroundColor: AppColors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: AppColors.backgroundColorLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.kRadius6),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.all(Colors.white),
    ),
    radioTheme: const RadioThemeData(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
    datePickerTheme: DatePickerThemeData(
      headerHeadlineStyle: AppTextStyles.font20Bold,
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: AppColors.primaryColor,
      unselectedLabelColor: Colors.black,
    ),
    badgeTheme: const BadgeThemeData(
      backgroundColor: AppColors.red,
      textColor: Colors.white,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    fontFamily: AppConstants.kMainFont,
    scaffoldBackgroundColor: AppColors.backgroundColorDark,
    disabledColor: AppColors.gray,
    colorScheme: ColorScheme.dark(
      brightness: Brightness.dark,
      primary: AppColors.primaryColor,
      secondary: AppColors.primaryColor.withValues(alpha: 0.3),
      onPrimary: AppColors.white,
      shadow: AppColors.moreDarkGray,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundColorDark,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      dragHandleColor: AppColors.secondGray,
      backgroundColor: AppColors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: AppColors.backgroundColorDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.kRadius6),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.all(Colors.white),
    ),
    radioTheme: const RadioThemeData(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
    datePickerTheme: DatePickerThemeData(
      headerHeadlineStyle: AppTextStyles.font20Bold,
      backgroundColor: AppColors.backgroundColorDark,
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: AppColors.primaryColor,
      unselectedLabelColor: Colors.white,
    ),
    badgeTheme: const BadgeThemeData(
      backgroundColor: AppColors.red,
      textColor: Colors.white,
    ),
  );
}
