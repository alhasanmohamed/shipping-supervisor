import 'package:shipping_user_app/features/notifications/logic/notifications_cubit.dart';
import 'package:shipping_user_app/features/permission/logic/permission_cubit.dart';
import 'package:shipping_user_app/features/permission/logic/permission_state.dart';
import 'package:shipping_user_app/features/localization/logic/locale_cubit.dart';
import 'package:shipping_user_app/features/profile/logic/profile_cubit.dart';
import 'package:shipping_user_app/features/theme/data/models/app_theme.dart';
import 'package:shipping_user_app/core/helpers/custom_scroll_behavior.dart';
import 'package:shipping_user_app/features/theme/logic/theme_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shipping_user_app/core/di/dependency_injection.dart';
import 'package:shipping_user_app/core/helpers/app_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipping_user_app/core/routing/app_router.dart';
import 'package:shipping_user_app/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ShippingSupervisorApp extends StatelessWidget {
  const ShippingSupervisorApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugInvertOversizedImages = true;
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => getIt<LocaleCubit>()),
          BlocProvider(create: (_) => getIt<ThemeCubit>()),
          BlocProvider(create: (_) => getIt<NotificationsCubit>()),
          BlocProvider(
            create: (_) => getIt<PermissionCubit>()
              ..checkLocationService()
              ..serviceStatusStream(),
          ),
          BlocProvider(create: (_) => getIt<ProfileCubit>()..getPoliciesDocuments()),
        ],
        child: BlocBuilder<PermissionCubit, PermissionState>(
          builder: (context, permissionState) {
            return BlocBuilder<LocaleCubit, Locale>(
              builder: (context, locale) {
                return BlocBuilder<ThemeCubit, ThemeMode>(
                  builder: (context, theme) {
                    return MaterialApp.router(
                      routerConfig: goRouter,
                      title: AppConstants.kAppTitle,
                      debugShowCheckedModeBanner: false,
                      theme: AppTheme.lightTheme,
                      darkTheme: AppTheme.darkTheme,
                      themeMode: theme,
                      locale: locale,
                      scrollBehavior: CustomScrollBehavior(),
                      supportedLocales: S.delegate.supportedLocales,
                      localizationsDelegates: const [
                        S.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                      ],
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
