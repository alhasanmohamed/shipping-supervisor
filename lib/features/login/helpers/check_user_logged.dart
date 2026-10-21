import 'package:shipping_user_app/core/local/secure_storage/secure_storage_service.dart';
import 'package:shipping_user_app/core/di/dependency_injection.dart';
import 'package:shipping_user_app/core/helpers/app_constants.dart';
import 'package:shipping_user_app/core/helpers/extensions.dart';

Future<bool> isUserSignIn() async {
  final token = await getIt<SecureStorageService>().readString(key: AppConstants.kTokenKey);
  return token.isNullOrEmpty() ? false : true;
}