import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../helpers/token_storage.dart';
import 'api_constants.dart';
import 'auth_interceptor.dart';

class DioFactory {
  DioFactory._();

  static Dio create(TokenStorage storage) {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: ApiConstants.connectTimeout,
        receiveTimeout: ApiConstants.receiveTimeout,
        headers: {'Accept': 'application/json'},
      ),
    );

    dio.interceptors.add(AuthInterceptor(storage));

    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: false,
          responseBody: true,
          error: true,
          compact: true,
          maxWidth: 120,
        ),
      );
    }

    return dio;
  }
}
