import 'package:shipping_user_app/generated/l10n.dart';
import 'package:shipping_user_app/core/helpers/app_constants.dart';

abstract class TextEditingValidator {
  static String? validateName(String? name) {
    if (name!.isEmpty) {
      return S.current.error_field_required;
    }
    final List<String> names = name.split(' ');
    return names.length < 4 ? S.current.error_name_field : null;
  }

  static String? validateEmail(String? email) {
    final regex = RegExp(AppConstants.kEmailPattern);
    if (email!.isEmpty) {
      return S.current.error_field_required;
    }
    return !regex.hasMatch(email) ? S.current.error_not_valid_email : null;
  }

  static String? validatePassword(String? password) {
    if (password!.isEmpty) {
      return S.current.error_field_required;
    }
    if (password.length < 8) {
      return S.current.error_not_valid_password;
    }
    return null;
  }

  static String? validateConfirmPassword(String? password, String? confirmPassword) {
    if (confirmPassword!.isEmpty) {
      return S.current.error_field_required;
    }
    if (password == confirmPassword) {
      return null;
    } else {
      return S.current.error_not_valid_confirm_password;
    }
  }

  static String? validateEmptyField(String? value) {
    if (value!.isEmpty) {
      return S.current.error_field_required;
    }
    return null;
  }

  static String? validateEmptyFieldNumber(int? value) {
    if (value == null) {
      return S.current.error_field_required;
    }
    return null;
  }
}
