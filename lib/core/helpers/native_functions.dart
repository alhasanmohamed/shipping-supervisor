import 'dart:io';
import 'package:shipping_user_app/core/helpers/extensions.dart';
import 'package:flutter/services.dart';

class NativeFunctions {
  static const _platform = MethodChannel('com.bonyan.innovation');

  static Future<int> getAndroidVersion() async {
    if (Platform.isAndroid) {
      try {
        return await _platform.invokeMethod('androidVersion');
      } on PlatformException catch (e) {
        "Failed to get android version: '${e.message}'".redDebugPrint();
        return 0;
      } catch (e) {
        "Failed: '$e'".redDebugPrint();
        return 0;
      }
    } else {
      return -1;
    }
  }
}
