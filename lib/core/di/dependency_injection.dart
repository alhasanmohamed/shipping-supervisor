import 'package:shipping_user_app/core/local/shared_pref_service/shared_pref_service.dart';
import 'package:shipping_user_app/core/local/secure_storage/secure_storage_service.dart';
import 'package:shipping_user_app/core/networking/supabase/supabase_service.dart';
import 'package:shipping_user_app/features/bottom_nav/logic/bottom_nav_cubit.dart';
import 'package:shipping_user_app/features/home/data/repo/home_repo.dart';
import 'package:shipping_user_app/features/home/logic/home_cubit.dart';
import 'package:shipping_user_app/features/permission/logic/permission_cubit.dart';
import 'package:shipping_user_app/features/register/data/repo/register_repo.dart';
import 'package:shipping_user_app/features/localization/logic/locale_cubit.dart';
import 'package:shipping_user_app/features/profile/data/repo/profile_repo.dart';
import 'package:shipping_user_app/features/register/logic/register_cubit.dart';
import 'package:shipping_user_app/features/profile/logic/profile_cubit.dart';
import 'package:shipping_user_app/features/login/data/repo/login_repo.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shipping_user_app/features/login/logic/login_cubit.dart';
import 'package:shipping_user_app/features/theme/logic/theme_cubit.dart';
import 'package:shipping_user_app/core/networking/api_service.dart';
import 'package:shipping_user_app/core/networking/dio_factory.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt({required String supabaseUrl, required String roleKey}) async {

  // Supabase
  final supabaseInstance = Supabase.instance;
  getIt.registerLazySingleton<SupabaseService>(() => SupabaseService(supabaseInstance, supabaseUrl, roleKey));

  // Shared Preferences
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPrefService>(() => SharedPrefService(prefs));

  // Secure Storage
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  getIt.registerLazySingleton<SecureStorageService>(() => SecureStorageService(storage));

  // Dio & Api Service
  final Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Localization
  getIt.registerLazySingleton<LocaleCubit>(() => LocaleCubit(getIt()));

  // Theme
  getIt.registerLazySingleton<ThemeCubit>(() => ThemeCubit(getIt()));

  // Permission
  getIt.registerSingleton<PermissionCubit>(PermissionCubit());

  // Bottom Nav
  getIt.registerFactory<BottomNavCubit>(() => BottomNavCubit());

  // Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt(), getIt(), getIt()));

  // Register
  getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepo(getIt()));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt(), getIt(), getIt()));

  // Profile
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo(getIt()));
  getIt.registerSingleton<ProfileCubit>(ProfileCubit(getIt()));

  // Home
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
}
