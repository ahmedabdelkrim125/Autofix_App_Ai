import '../../../../core/helpers/token_storage.dart';
import '../../../../core/networking/api_error_model.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../../../../core/networking/models/message_response.dart';
import '../models/forgot_password_request_body.dart';
import '../models/login_request_body.dart';
import '../models/login_response.dart';
import '../models/reset_password_request_body.dart';
import '../models/signup_request_body.dart';

class AuthRepo {
  AuthRepo(this._api, this._storage);

  final ApiService _api;
  final TokenStorage _storage;

  Future<ApiResult<LoginResponse>> login(LoginRequestBody body) async {
    final result = await safeApiCall(() => _api.login(body));
    if (result is Success<LoginResponse>) {
      final accessToken = result.data.data?.accessToken;
      final refreshToken = result.data.data?.refreshToken;
      if (accessToken == null || refreshToken == null) {
        return ApiResult.failure(
          const ApiErrorModel(message: 'Invalid server response'),
        );
      }
      await _storage.saveTokens(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );
    }
    return result;
  }

  Future<ApiResult<MessageResponse>> signup(SignupRequestBody body) {
    return safeApiCall(() => _api.signup(body));
  }

  Future<ApiResult<MessageResponse>> forgotPassword(
    ForgotPasswordRequestBody body,
  ) {
    return safeApiCall(() => _api.forgotPassword(body));
  }

  Future<ApiResult<MessageResponse>> resetPassword(
    ResetPasswordRequestBody body,
  ) {
    return safeApiCall(() => _api.resetPassword(body));
  }
}
