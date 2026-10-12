import 'package:dio/dio.dart';
import 'api_error_model.dart';

class ApiErrorHandler {
  ApiErrorHandler._();

  static ApiErrorModel handle(Object error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.transformTimeout:
          return const ApiErrorModel(
            message: 'Connection timed out, please try again',
          );
        case DioExceptionType.connectionError:
          return const ApiErrorModel(message: 'No internet connection');
        case DioExceptionType.cancel:
          return const ApiErrorModel(message: 'Request was cancelled');
        case DioExceptionType.badCertificate:
          return const ApiErrorModel(message: 'Invalid server certificate');
        case DioExceptionType.badResponse:
          return ApiErrorModel.fromResponse(
            error.response?.data,
            statusCode: error.response?.statusCode,
          );
        case DioExceptionType.unknown:
          return const ApiErrorModel(message: 'Unexpected error occurred');
      }
    }
    return const ApiErrorModel(message: 'Unexpected error occurred');
  }
}
