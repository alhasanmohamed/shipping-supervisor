import 'dart:ui';
import 'package:shipping_user_app/core/local/shared_pref_service/shared_pref_service.dart';
import 'package:shipping_user_app/features/localization/data/models/language_model.dart';
import 'package:shipping_user_app/core/helpers/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocaleCubit extends Cubit<Locale> {
  final SharedPrefService _sharedPrefService;
  LocaleCubit(this._sharedPrefService) : super(const Locale('ar', 'SA')) {
    PlatformDispatcher.instance.locale;
    emit(_getLocale());
  }

  void changeLanguage(LanguageModel language) {
    _sharedPrefService.setMap(
      key: AppConstants.kLangKey,
      value: LanguageModel(
        languageCode: language.languageCode,
        countryCode: language.countryCode,
        localeName: language.localeName,
      ).toJson(),
    );
    emit(Locale(language.languageCode, language.countryCode));
  }

  Locale _getLocale() {
    final locale = _sharedPrefService.getMap(key: AppConstants.kLangKey);
    if (locale == null) {
      return const Locale('ar', 'SA');
    } else {
      final languageModel = LanguageModel.fromJson(locale);
      return Locale(
        languageModel.languageCode,
        languageModel.countryCode,
      );
    }
  }

  LanguageModel getLanguage() {
    final locale = _sharedPrefService.getMap(key: AppConstants.kLangKey);
    if (locale == null) {
      return languages[0];
    } else {
      final languageModel = LanguageModel.fromJson(locale);
      return languageModel;
    }
  }

  List<LanguageModel> languages = [
    LanguageModel(
      languageCode: 'ar',
      countryCode: 'SA',
      localeName: 'العربية',
    ),
    LanguageModel(
      languageCode: 'en',
      countryCode: 'US',
      localeName: 'English',
    ),
  ];
}
