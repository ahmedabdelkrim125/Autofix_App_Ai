import '../../../../core/helpers/token_storage.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../../../../core/networking/models/message_response.dart';
import '../models/logout_request_body.dart';
import '../models/profile_response.dart';

class ProfileRepo {
  ProfileRepo(this._api, this._storage);

  final ApiService _api;
  final TokenStorage _storage;

  Future<ApiResult<ProfileResponse>> getProfile() {
    return safeApiCall(() => _api.getProfile());
  }

  Future<ApiResult<MessageResponse>> logout() async {
    final result = await safeApiCall(
      () => _api.logout(const LogoutRequestBody()),
    );
    await _storage.clear();
    return result;
  }
}
