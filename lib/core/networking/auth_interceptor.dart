import 'package:dio/dio.dart';
import '../helpers/token_storage.dart';
import 'api_constants.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._storage)
    : _bareDio = Dio(
        BaseOptions(
          baseUrl: ApiConstants.baseUrl,
          connectTimeout: ApiConstants.connectTimeout,
          receiveTimeout: ApiConstants.receiveTimeout,
        ),
      );

  final TokenStorage _storage;
  final Dio _bareDio;
  Future<String?>? _refreshing;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _storage.accessToken;
    if (token != null &&
        token.isNotEmpty &&
        !ApiConstants.publicPaths.contains(options.path)) {
      options.headers['Authorization'] = '${_storage.authScheme}$token';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final statusCode = err.response?.statusCode;
    final path = err.requestOptions.path;
    final isPublic = ApiConstants.publicPaths.contains(path);
    final accessToken = _storage.accessToken;

    if (statusCode == 403 &&
        !isPublic &&
        accessToken != null &&
        _storage.authScheme != ApiConstants.adminAuthScheme &&
        _errorMessage(err).contains('System token')) {
      await _storage.saveAuthScheme(ApiConstants.adminAuthScheme);
      return _retry(err, accessToken, handler);
    }

    final refreshToken = _storage.refreshToken;
    final canRefresh =
        statusCode == 401 &&
        !isPublic &&
        refreshToken != null &&
        refreshToken.isNotEmpty;

    if (!canRefresh) {
      return handler.next(err);
    }

    final newAccessToken = await _refresh(refreshToken);
    if (newAccessToken == null) {
      return handler.next(err);
    }

    return _retry(err, newAccessToken, handler);
  }

  Future<void> _retry(
    DioException err,
    String token,
    ErrorInterceptorHandler handler,
  ) async {
    try {
      final options = err.requestOptions;
      options.headers['Authorization'] = '${_storage.authScheme}$token';
      final body = options.data;
      if (body is FormData) {
        options.data = body.clone();
      }
      final response = await _bareDio.fetch<dynamic>(options);
      return handler.resolve(response);
    } on DioException catch (retryError) {
      return handler.next(retryError);
    }
  }

  String _errorMessage(DioException err) {
    final data = err.response?.data;
    if (data is Map) {
      return data['message']?.toString() ?? '';
    }
    return '';
  }

  Future<String?> _refresh(String refreshToken) {
    return _refreshing ??= _doRefresh(refreshToken).whenComplete(() {
      _refreshing = null;
    });
  }

  Future<String?> _doRefresh(String refreshToken) async {
    try {
      final response = await _bareDio.post<dynamic>(
        ApiConstants.refreshToken,
        data: {'refreshToken': refreshToken},
        options: Options(
          headers: {'Authorization': '${_storage.authScheme}$refreshToken'},
        ),
      );
      final body = response.data;
      if (body is! Map) {
        await _storage.clear();
        return null;
      }
      final payload = Map<String, dynamic>.from(
        body['data'] is Map ? body['data'] as Map : body,
      );
      final accessToken = payload['accessToken'] as String?;
      final newRefreshToken =
          (payload['refreshToken'] as String?) ?? refreshToken;
      if (accessToken == null) {
        await _storage.clear();
        return null;
      }
      await _storage.saveTokens(
        accessToken: accessToken,
        refreshToken: newRefreshToken,
      );
      return accessToken;
    } catch (_) {
      await _storage.clear();
      return null;
    }
  }
}
