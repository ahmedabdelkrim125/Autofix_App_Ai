import 'dart:io';
import 'package:dio/dio.dart';
import '../../../../core/constants/app_location.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../../../history/data/models/fault_history_response.dart';
import '../models/diagnose_response.dart';

class FaultRepo {
  FaultRepo(this._api);

  final ApiService _api;

  static const Map<String, String> _mimeTypes = {
    'jpg': 'image/jpeg',
    'jpeg': 'image/jpeg',
    'png': 'image/png',
    'webp': 'image/webp',
    'gif': 'image/gif',
    'heic': 'image/heic',
  };

  Future<ApiResult<DiagnoseResponse>> diagnoseText(String text) {
    return safeApiCall(
      () => _api.diagnoseText(
        'text',
        text,
        AppLocation.longitude.toString(),
        AppLocation.latitude.toString(),
      ),
    );
  }

  Future<ApiResult<DiagnoseResponse>> diagnoseImage(File image) {
    return safeApiCall(() async {
      final fileName = image.path.split(RegExp(r'[\\/]')).last;
      final extension = fileName.contains('.')
          ? fileName.split('.').last.toLowerCase()
          : '';
      final file = await MultipartFile.fromFile(
        image.path,
        filename: fileName,
        contentType: DioMediaType.parse(
          _mimeTypes[extension] ?? 'application/octet-stream',
        ),
      );
      return _api.diagnoseImage(
        'image',
        AppLocation.longitude.toString(),
        AppLocation.latitude.toString(),
        file,
      );
    });
  }

  Future<ApiResult<FaultHistoryResponse>> getHistory({
    int page = 1,
    int limit = 50,
  }) {
    return safeApiCall(() => _api.getFaultHistory(page, limit));
  }
}
