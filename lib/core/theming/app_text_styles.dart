import 'package:shipping_user_app/core/helpers/app_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipping_user_app/core/theming/app_colors.dart';
import 'package:shipping_user_app/core/theming/app_fonts.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyles {
  /// Font 24
  static TextStyle font24SemiBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: AppFontWeights.semiBold,
    fontFamily: AppConstants.kMainFont,
  );

  /// Font 22
  static TextStyle font22Bold = TextStyle(
    fontSize: 22.sp,
    fontWeight: AppFontWeights.bold,
    fontFamily: AppConstants.kMainFont,
  );

  /// Font 20
  static TextStyle font20Bold = TextStyle(
    fontSize: 20.sp,
    fontWeight: AppFontWeights.bold,
    fontFamily: AppConstants.kMainFont,
  );

  /// Font 18
  static TextStyle font18SemiBoldWhite = TextStyle(
    fontSize: 18.sp,
    fontWeight: AppFontWeights.semiBold,
    color: AppColors.white,
    fontFamily: AppConstants.kMainFont,
  );
  static TextStyle font18Bold = TextStyle(
    fontSize: 18.sp,
    fontWeight: AppFontWeights.bold,
    fontFamily: AppConstants.kMainFont,
  );

  /// Font 16
  static TextStyle font16ExtraBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: AppFontWeights.extraBold,
    fontFamily: AppConstants.kMainFont,
  );
  static TextStyle font16Bold = TextStyle(
    fontSize: 16.sp,
    fontWeight: AppFontWeights.bold,
    fontFamily: AppConstants.kMainFont,
  );
  static TextStyle font16SemiBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: AppFontWeights.semiBold,
    fontFamily: AppConstants.kMainFont,
  );
  static TextStyle font16Medium = TextStyle(
    fontSize: 16.sp,
    fontWeight: AppFontWeights.medium,
    fontFamily: AppConstants.kMainFont,
  );
  static TextStyle font16SemiBoldGray = TextStyle(
    fontSize: 16.sp,
    fontWeight: AppFontWeights.semiBold,
    color: AppColors.gray,
    fontFamily: AppConstants.kMainFont,
  );

  /// Font 14
  static TextStyle font14Bold = TextStyle(
    fontSize: 14.sp,
    fontWeight: AppFontWeights.bold,
    fontFamily: AppConstants.kMainFont,
  );
  static TextStyle font14SemiBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: AppFontWeights.semiBold,
    fontFamily: AppConstants.kMainFont,
  );
  static TextStyle font14Medium = TextStyle(
    fontSize: 14.sp,
    fontWeight: AppFontWeights.medium,
    fontFamily: AppConstants.kMainFont,
  );
  static TextStyle font14SemiBoldGray = TextStyle(
    fontSize: 14.sp,
    fontWeight: AppFontWeights.semiBold,
    color: AppColors.gray,
    fontFamily: AppConstants.kMainFont,
  );
  static TextStyle font14SemiBoldPrimary = TextStyle(
    fontSize: 14.sp,
    fontWeight: AppFontWeights.semiBold,
    color: AppColors.primaryColor,
    fontFamily: AppConstants.kMainFont,
  );

  /// Font 13
  static TextStyle font13Bold = TextStyle(
    fontSize: 13.sp,
    fontWeight: AppFontWeights.bold,
    fontFamily: AppConstants.kMainFont,
  );
  static TextStyle font13SemiBoldGray = TextStyle(
    fontSize: 13.sp,
    fontWeight: AppFontWeights.semiBold,
    color: AppColors.gray,
    fontFamily: AppConstants.kMainFont,
  );
  static TextStyle font13Medium = TextStyle(
    fontSize: 13.sp,
    fontWeight: AppFontWeights.medium,
    fontFamily: AppConstants.kMainFont,
  );
  static TextStyle font13Regular = TextStyle(
    fontSize: 13.sp,
    fontWeight: AppFontWeights.regular,
    fontFamily: AppConstants.kMainFont,
  );

  /// Font 12
  static TextStyle font12Bold = TextStyle(
    fontSize: 12.sp,
    fontWeight: AppFontWeights.bold,
    fontFamily: AppConstants.kMainFont,
  );
  static TextStyle font12Medium = TextStyle(
    fontSize: 12.sp,
    fontWeight: AppFontWeights.medium,
    fontFamily: AppConstants.kMainFont,
  );
  static TextStyle font12BoldGray = TextStyle(
    fontSize: 12.sp,
    fontWeight: AppFontWeights.bold,
    color: AppColors.gray,
    fontFamily: AppConstants.kMainFont,
  );
  static TextStyle font12SemiBold = TextStyle(
    fontSize: 12.sp,
    fontWeight: AppFontWeights.semiBold,
    fontFamily: AppConstants.kMainFont,
  );
  static TextStyle font12RegularGray = TextStyle(
    fontSize: 12.sp,
    fontWeight: AppFontWeights.regular,
    color: AppColors.gray,
    fontFamily: AppConstants.kMainFont,
  );

  /// Font 10
  static TextStyle font10Medium = TextStyle(
    fontSize: 10.sp,
    fontWeight: AppFontWeights.medium,
    fontFamily: AppConstants.kMainFont,
  );
}
