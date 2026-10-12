import 'package:shared_preferences/shared_preferences.dart';
import '../networking/api_constants.dart';

class TokenStorage {
  TokenStorage(this._prefs);

  final SharedPreferences _prefs;

  static const String _accessKey = 'access_token';
  static const String _refreshKey = 'refresh_token';
  static const String _schemeKey = 'auth_scheme';

  String? get accessToken => _prefs.getString(_accessKey);
  String? get refreshToken => _prefs.getString(_refreshKey);
  String get authScheme =>
      _prefs.getString(_schemeKey) ?? ApiConstants.authScheme;
  bool get hasSession => (accessToken ?? '').isNotEmpty;

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _prefs.setString(_accessKey, accessToken);
    await _prefs.setString(_refreshKey, refreshToken);
  }

  Future<void> saveAuthScheme(String scheme) async {
    await _prefs.setString(_schemeKey, scheme);
  }

  Future<void> clear() async {
    await _prefs.remove(_accessKey);
    await _prefs.remove(_refreshKey);
    await _prefs.remove(_schemeKey);
  }
}
