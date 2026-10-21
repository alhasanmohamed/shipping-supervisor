// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome 👋`
  String get welcome {
    return Intl.message(
      'Welcome 👋',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Sign in to continue`
  String get enter_data {
    return Intl.message(
      'Sign in to continue',
      name: 'enter_data',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgot_password {
    return Intl.message(
      'Forgot Password?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get sign_in {
    return Intl.message(
      'Sign In',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get not_registered {
    return Intl.message(
      'Don\'t have an account?',
      name: 'not_registered',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get sign_up_now {
    return Intl.message(
      'Sign Up',
      name: 'sign_up_now',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register_title {
    return Intl.message(
      'Register',
      name: 'register_title',
      desc: '',
      args: [],
    );
  }

  /// `Register your account to login`
  String get register_description {
    return Intl.message(
      'Register your account to login',
      name: 'register_description',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get accept {
    return Intl.message(
      'Accept',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get terms_conditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'terms_conditions',
      desc: '',
      args: [],
    );
  }

  /// `Have an account?`
  String get have_account {
    return Intl.message(
      'Have an account?',
      name: 'have_account',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get sign_up {
    return Intl.message(
      'Sign Up',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirm_password {
    return Intl.message(
      'Confirm password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Accept on`
  String get accept_on {
    return Intl.message(
      'Accept on',
      name: 'accept_on',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get terms_and_conditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'terms_and_conditions',
      desc: '',
      args: [],
    );
  }

  /// `Privacy & Policy`
  String get privacy_and_policy {
    return Intl.message(
      'Privacy & Policy',
      name: 'privacy_and_policy',
      desc: '',
      args: [],
    );
  }

  /// `Personal\nInformation`
  String get personal_information {
    return Intl.message(
      'Personal\nInformation',
      name: 'personal_information',
      desc: '',
      args: [],
    );
  }

  /// `Licences`
  String get licences {
    return Intl.message(
      'Licences',
      name: 'licences',
      desc: '',
      args: [],
    );
  }

  /// `Business\nData`
  String get business_data {
    return Intl.message(
      'Business\nData',
      name: 'business_data',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Login Information`
  String get login_information {
    return Intl.message(
      'Login Information',
      name: 'login_information',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get date_of_birth {
    return Intl.message(
      'Date of Birth',
      name: 'date_of_birth',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get age {
    return Intl.message(
      'Age',
      name: 'age',
      desc: '',
      args: [],
    );
  }

  /// `Medical Insurance Number`
  String get medical_insurance_number {
    return Intl.message(
      'Medical Insurance Number',
      name: 'medical_insurance_number',
      desc: '',
      args: [],
    );
  }

  /// `Nationality`
  String get nationality {
    return Intl.message(
      'Nationality',
      name: 'nationality',
      desc: '',
      args: [],
    );
  }

  /// `Search for country`
  String get country_search {
    return Intl.message(
      'Search for country',
      name: 'country_search',
      desc: '',
      args: [],
    );
  }

  /// `ID Number`
  String get id_number {
    return Intl.message(
      'ID Number',
      name: 'id_number',
      desc: '',
      args: [],
    );
  }

  /// `ID Image`
  String get id_image {
    return Intl.message(
      'ID Image',
      name: 'id_image',
      desc: '',
      args: [],
    );
  }

  /// `Iqama Number`
  String get iqama_number {
    return Intl.message(
      'Iqama Number',
      name: 'iqama_number',
      desc: '',
      args: [],
    );
  }

  /// `Iqama Image`
  String get iqama_image {
    return Intl.message(
      'Iqama Image',
      name: 'iqama_image',
      desc: '',
      args: [],
    );
  }

  /// `Passport Number (optional)`
  String get passport_number {
    return Intl.message(
      'Passport Number (optional)',
      name: 'passport_number',
      desc: '',
      args: [],
    );
  }

  /// `Passport Image`
  String get passport_image {
    return Intl.message(
      'Passport Image',
      name: 'passport_image',
      desc: '',
      args: [],
    );
  }

  /// `Max image size is {size} MB`
  String max_image_size(Object size) {
    return Intl.message(
      'Max image size is $size MB',
      name: 'max_image_size',
      desc: '',
      args: [size],
    );
  }

  /// `Max size is {size} MB`
  String max_size(Object size) {
    return Intl.message(
      'Max size is $size MB',
      name: 'max_size',
      desc: '',
      args: [size],
    );
  }

  /// `Region`
  String get region {
    return Intl.message(
      'Region',
      name: 'region',
      desc: '',
      args: [],
    );
  }

  /// `Provider`
  String get provider {
    return Intl.message(
      'Provider',
      name: 'provider',
      desc: '',
      args: [],
    );
  }

  /// `Select Region`
  String get select_region {
    return Intl.message(
      'Select Region',
      name: 'select_region',
      desc: '',
      args: [],
    );
  }

  /// `Select Provider`
  String get select_provider {
    return Intl.message(
      'Select Provider',
      name: 'select_provider',
      desc: '',
      args: [],
    );
  }

  /// `Driving License number`
  String get driving_license_number {
    return Intl.message(
      'Driving License number',
      name: 'driving_license_number',
      desc: '',
      args: [],
    );
  }

  /// `Driving License Image`
  String get driving_license_image {
    return Intl.message(
      'Driving License Image',
      name: 'driving_license_image',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle Plate Number`
  String get vehicle_plate_number {
    return Intl.message(
      'Vehicle Plate Number',
      name: 'vehicle_plate_number',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle Plate Image`
  String get vehicle_plate_image {
    return Intl.message(
      'Vehicle Plate Image',
      name: 'vehicle_plate_image',
      desc: '',
      args: [],
    );
  }

  /// `Guarantee Document Image`
  String get guarantee_document_image {
    return Intl.message(
      'Guarantee Document Image',
      name: 'guarantee_document_image',
      desc: '',
      args: [],
    );
  }

  /// `Representatives List`
  String get representatives_list {
    return Intl.message(
      'Representatives List',
      name: 'representatives_list',
      desc: '',
      args: [],
    );
  }

  /// `Coin Balance`
  String get coin_balance {
    return Intl.message(
      'Coin Balance',
      name: 'coin_balance',
      desc: '',
      args: [],
    );
  }

  /// `Your Balance`
  String get your_balance {
    return Intl.message(
      'Your Balance',
      name: 'your_balance',
      desc: '',
      args: [],
    );
  }

  /// `Top Up`
  String get top_up {
    return Intl.message(
      'Top Up',
      name: 'top_up',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get see_all {
    return Intl.message(
      'See All',
      name: 'see_all',
      desc: '',
      args: [],
    );
  }

  /// `Representative Tracking`
  String get representative_tracking {
    return Intl.message(
      'Representative Tracking',
      name: 'representative_tracking',
      desc: '',
      args: [],
    );
  }

  /// `Last Seen`
  String get last_seen {
    return Intl.message(
      'Last Seen',
      name: 'last_seen',
      desc: '',
      args: [],
    );
  }

  /// `Active Now`
  String get active_now {
    return Intl.message(
      'Active Now',
      name: 'active_now',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get unknown {
    return Intl.message(
      'Unknown',
      name: 'unknown',
      desc: '',
      args: [],
    );
  }

  /// `No representatives found`
  String get no_representatives {
    return Intl.message(
      'No representatives found',
      name: 'no_representatives',
      desc: '',
      args: [],
    );
  }

  /// `Shipment History`
  String get shipment_history {
    return Intl.message(
      'Shipment History',
      name: 'shipment_history',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get completed {
    return Intl.message(
      'Completed',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `In Delivery`
  String get in_delivery {
    return Intl.message(
      'In Delivery',
      name: 'in_delivery',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get pending {
    return Intl.message(
      'Pending',
      name: 'pending',
      desc: '',
      args: [],
    );
  }

  /// `Messages`
  String get messages {
    return Intl.message(
      'Messages',
      name: 'messages',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `No notifications found`
  String get no_notifications_found {
    return Intl.message(
      'No notifications found',
      name: 'no_notifications_found',
      desc: '',
      args: [],
    );
  }

  /// `Results`
  String get results {
    return Intl.message(
      'Results',
      name: 'results',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message(
      'Reset',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `Open App Settings`
  String get open_app_settings {
    return Intl.message(
      'Open App Settings',
      name: 'open_app_settings',
      desc: '',
      args: [],
    );
  }

  /// `App Version`
  String get app_version {
    return Intl.message(
      'App Version',
      name: 'app_version',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Choose Theme`
  String get choose_theme {
    return Intl.message(
      'Choose Theme',
      name: 'choose_theme',
      desc: '',
      args: [],
    );
  }

  /// `System Default`
  String get default_system_theme {
    return Intl.message(
      'System Default',
      name: 'default_system_theme',
      desc: '',
      args: [],
    );
  }

  /// `Light Theme`
  String get light_theme {
    return Intl.message(
      'Light Theme',
      name: 'light_theme',
      desc: '',
      args: [],
    );
  }

  /// `Dark Theme`
  String get dark_theme {
    return Intl.message(
      'Dark Theme',
      name: 'dark_theme',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get confirm {
    return Intl.message(
      'Ok',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `ok`
  String get ok {
    return Intl.message(
      'ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `You must accept terms and conditions`
  String get error_terms_conditions {
    return Intl.message(
      'You must accept terms and conditions',
      name: 'error_terms_conditions',
      desc: '',
      args: [],
    );
  }

  /// `Name must be full name (4 words)`
  String get error_name_field {
    return Intl.message(
      'Name must be full name (4 words)',
      name: 'error_name_field',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get error_field_required {
    return Intl.message(
      'This field is required',
      name: 'error_field_required',
      desc: '',
      args: [],
    );
  }

  /// `Not valid email`
  String get error_not_valid_email {
    return Intl.message(
      'Not valid email',
      name: 'error_not_valid_email',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 digits`
  String get error_not_valid_password {
    return Intl.message(
      'Password must be at least 8 digits',
      name: 'error_not_valid_password',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get error_not_valid_confirm_password {
    return Intl.message(
      'Passwords do not match',
      name: 'error_not_valid_confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error occurred, try again later`
  String get error_unknown {
    return Intl.message(
      'Unknown error occurred, try again later',
      name: 'error_unknown',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong!`
  String get warning_title {
    return Intl.message(
      'Something went wrong!',
      name: 'warning_title',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to leave ? data provided will be lost.`
  String get warning_data_will_be_lost {
    return Intl.message(
      'Are you sure you want to leave ? data provided will be lost.',
      name: 'warning_data_will_be_lost',
      desc: '',
      args: [],
    );
  }

  /// `App won't work without location access. Please enable "Location" in settings for a seamless experience`
  String get warning_location_permission {
    return Intl.message(
      'App won\'t work without location access. Please enable "Location" in settings for a seamless experience',
      name: 'warning_location_permission',
      desc: '',
      args: [],
    );
  }

  /// `App won't work without notification access. Please enable "Notification" in settings for a seamless experience'`
  String get warning_notification_permission {
    return Intl.message(
      'App won\'t work without notification access. Please enable "Notification" in settings for a seamless experience\'',
      name: 'warning_notification_permission',
      desc: '',
      args: [],
    );
  }

  /// `App needs to access your camera. Please enable "Camera" in settings`
  String get warning_camera_permission {
    return Intl.message(
      'App needs to access your camera. Please enable "Camera" in settings',
      name: 'warning_camera_permission',
      desc: '',
      args: [],
    );
  }

  /// `App needs to access your photos. Please enable "Storage" in settings`
  String get warning_photos_permission {
    return Intl.message(
      'App needs to access your photos. Please enable "Storage" in settings',
      name: 'warning_photos_permission',
      desc: '',
      args: [],
    );
  }

  /// `Registered successfully, please wait admin approval`
  String get success_registered {
    return Intl.message(
      'Registered successfully, please wait admin approval',
      name: 'success_registered',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
