import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

abstract class AppConstants {
  static const String kAppTitle = "Bonyan Shipping App";

  static const String kMainFont = 'Cairo';

  static final double kRadius2 = 2.r;
  static final double kRadius6 = 6.r;
  static final double kRadius8 = 8.r;
  static final double kRadius10 = 10.r;
  static final double kRadius12 = 12.r;
  static final double kRadius14 = 14.r;
  static final double kRadius20 = 20.r;
  static final double kRadius25 = 25.r;
  static final double kRadius100 = 100.r;

  static final double kHorizontalPadding2 = 2.w;
  static final double kHorizontalPadding4 = 4.w;
  static final double kHorizontalPadding6 = 6.w;
  static final double kHorizontalPadding8 = 8.w;
  static final double kHorizontalPadding10 = 10.w;
  static final double kHorizontalPadding12 = 12.w;
  static final double kHorizontalPadding14 = 14.w;
  static final double kHorizontalPadding16 = 16.w;
  static final double kHorizontalPadding18 = 18.w;
  static final double kHorizontalPadding20 = 20.w;

  static final double kVerticalPadding2 = 2.h;
  static final double kVerticalPadding4 = 4.h;
  static final double kVerticalPadding6 = 6.h;
  static final double kVerticalPadding8 = 8.h;
  static final double kVerticalPadding10 = 10.h;
  static final double kVerticalPadding12 = 12.h;
  static final double kVerticalPadding14 = 14.h;
  static final double kVerticalPadding16 = 16.h;
  static final double kVerticalPadding18 = 18.h;
  static final double kVerticalPadding20 = 20.h;
  static final double kVerticalPadding38 = 38.h;

  static const String kThemeKey = 'theme';
  static const String kLangKey = 'lang';
  static const String kTokenKey = 'token';
  static const String kUserId = 'userId';

  static const String kSupabaseUrl = 'SUPABASE_URL';
  static const String kSupabaseAnonKey = 'ANON_KEY';
  static const String kServerRole = 'SERVICE_ROLE';

  static const String kEmailPattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static const String kPhonePattern = r"[^+\d]";
}
