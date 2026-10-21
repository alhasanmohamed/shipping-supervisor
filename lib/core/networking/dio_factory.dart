import 'package:shipping_user_app/core/local/secure_storage/secure_storage_service.dart';
import 'package:shipping_user_app/core/di/dependency_injection.dart';
import 'package:shipping_user_app/core/helpers/app_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio/dio.dart';

class DioFactory {
  /// Private Constructor ad I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;

  static Future<Dio> getDio() async {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut
        ..options.contentType = Headers.jsonContentType
        ..options.headers['Accept'] = Headers.jsonContentType;
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
    dio?.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          /// Add Authorization token in every request
          final token = await getIt<SecureStorageService>().readString(
            key: AppConstants.kTokenKey,
          );
          options.headers['Authorization'] = 'Bearer $token';
          return handler.next(options);
        },
      ),
    );
  }
}
