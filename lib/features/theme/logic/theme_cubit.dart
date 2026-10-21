import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipping_user_app/core/helpers/app_constants.dart';
import 'package:shipping_user_app/core/local/shared_pref_service/shared_pref_service.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  final SharedPrefService _sharedPrefService;
  ThemeCubit(this._sharedPrefService) : super(ThemeMode.system){
    switch (getTheme()) {
      case ThemeMode.system:
        emit(ThemeMode.system);
        break;
      case ThemeMode.light:
        emit(ThemeMode.light);
        break;
      case ThemeMode.dark:
        emit(ThemeMode.dark);
        break;
    }
  }

  void setTheme(ThemeMode themeMode) {
    _sharedPrefService.setString(
      key: AppConstants.kThemeKey,
      value: themeMode.name,
    );
    emit(themeMode);
  }

  void changeTheme(ThemeMode themeMode) => setTheme(themeMode);

  ThemeMode getTheme() {
    switch (_sharedPrefService.getString(key:AppConstants.kThemeKey)) {
      case 'system':
        return ThemeMode.system;
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.light;
    }
  }
}
