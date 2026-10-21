import 'package:shipping_user_app/features/profile/data/models/policies_documents_response.dart';
import 'package:shipping_user_app/features/home/ui/screens/representative_tracking_screen.dart';
import 'package:shipping_user_app/features/notifications/ui/screens/notifications_screen.dart';
import 'package:shipping_user_app/features/home/data/models/representative_model.dart';
import 'package:shipping_user_app/features/register/ui/screens/register_screen.dart';
import 'package:shipping_user_app/features/profile/ui/screens/policies_screen.dart';
import 'package:shipping_user_app/features/bottom_nav/logic/bottom_nav_cubit.dart';
import 'package:shipping_user_app/features/login/helpers/check_user_logged.dart';
import 'package:shipping_user_app/features/login/ui/screens/login_screen.dart';
import 'package:shipping_user_app/features/register/logic/register_cubit.dart';
import 'package:shipping_user_app/features/home/ui/screens/main_screen.dart';
import 'package:shipping_user_app/features/login/logic/login_cubit.dart';
import 'package:shipping_user_app/features/home/logic/home_cubit.dart';
import 'package:shipping_user_app/core/di/dependency_injection.dart';
import 'package:shipping_user_app/core/helpers/app_constants.dart';
import 'package:shipping_user_app/core/routing/nav_observer.dart';
import 'package:shipping_user_app/core/routing/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

GoRouter goRouter = GoRouter(
  navigatorKey: navigatorKey,
  routes: [
    /// Auth Routes
    GoRoute(
      path: Routes.loginScreen,
      pageBuilder: (_, state) => CustomTransitionPage(
        key: state.pageKey,
        transitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (_, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          );
        },
        child: BlocProvider(
          create: (_) => getIt<LoginCubit>(),
          child: const LoginScreen(),
        ),
      ),
    ),
    GoRoute(
      path: Routes.registerScreen,
      pageBuilder: (_, state) => CustomTransitionPage(
        key: state.pageKey,
        transitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (_, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          );
        },
        child: BlocProvider(
          create: (_) => getIt<RegisterCubit>(),
          child: const RegisterScreen(),
        ),
      ),
    ),

    /// Home Routes
    GoRoute(
      path: Routes.mainScreen,
      pageBuilder: (_, state) => CustomTransitionPage(
        key: state.pageKey,
        transitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (_, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          );
        },
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => getIt<BottomNavCubit>()),
            BlocProvider(create: (_) => getIt<HomeCubit>()..getRepresentatives()),
          ],
          child: const MainScreen(),
        ),
      ),
    ),

    GoRoute(
      path: Routes.packageDetailsScreen,
      pageBuilder: (context, state) {
        final args = state.extra as List;
        final representative = args[0] as RepresentativeModel;
        final homeCubit = args[1] as HomeCubit;
        return CustomTransitionPage(
          key: state.pageKey,
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (_, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
          child: BlocProvider.value(
            value: homeCubit..getRepresentativeLocation(representative.id),
            child: RepresentativeTrackingScreen(
              representative: representative,
              homeCubit: homeCubit,
            ),
          ),
        );
      },
    ),

    /// Profile Routes
    GoRoute(
      path: Routes.policiesScreen,
      pageBuilder: (_, state) => CustomTransitionPage(
        key: state.pageKey,
        transitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (_, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          );
        },
        child: PoliciesScreen(policiesDocument: state.extra as PoliciesDocuments),
      ),
    ),

    /// Notifications Routes
    GoRoute(
      path: Routes.notificationsScreen,
      pageBuilder: (_, state) => CustomTransitionPage(
        key: state.pageKey,
        transitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (_, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          );
        },
        child: const NotificationsScreen(),
      ),
    ),
  ],
  errorBuilder: (context, state) => const Scaffold(
    body: Center(
      child: Text("No route define for this route"),
    ),
  ),
  initialLocation: Routes.loginScreen,
  redirect: (context, state) async {
    final loggingIn = await isUserSignIn();
    return loggingIn ? Routes.mainScreen : null;
  },
  observers: [
    NavObserver.instance,
  ],
);
