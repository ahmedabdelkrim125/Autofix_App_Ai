import 'package:freezed_annotation/freezed_annotation.dart';
import 'api_error_handler.dart';
import 'api_error_model.dart';

part 'api_result.freezed.dart';

@freezed
sealed class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = Success<T>;
  const factory ApiResult.failure(ApiErrorModel error) = Failure<T>;
}

Future<ApiResult<T>> safeApiCall<T>(Future<T> Function() call) async {
  try {
    return ApiResult.success(await call());
  } catch (error) {
    return ApiResult.failure(ApiErrorHandler.handle(error));
  }
}
