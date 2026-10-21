import 'package:shipping_user_app/core/helpers/enums.dart';

abstract class CustomJsonHelper {
  static bool boolFromInt(int value) => value == 1;

  static DateTime? dateTimeFromStr(String? value) => value != null ? DateTime.parse(value) : null;

  static PackageStatus packageStatusFromInt(String? value) {
    switch (value) {
      case 'CONFIRMED':
        return PackageStatus.confirmed;
      case 'SHIPPING':
        return PackageStatus.shipping;
      case 'DELIVERED':
        return PackageStatus.delivered;
      default:
        return PackageStatus.none;
    }
  }
}
