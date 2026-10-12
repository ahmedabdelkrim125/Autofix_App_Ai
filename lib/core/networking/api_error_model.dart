import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error_model.freezed.dart';

@freezed
abstract class ApiErrorModel with _$ApiErrorModel {
  const ApiErrorModel._();

  const factory ApiErrorModel({
    required String message,
    int? statusCode,
    @Default(<String>[]) List<String> errors,
  }) = _ApiErrorModel;

  factory ApiErrorModel.fromResponse(dynamic data, {int? statusCode}) {
    final errors = <String>[];
    String? message;

    if (data is Map) {
      final rawMessage = data['message'] ?? data['error'];
      if (rawMessage is String) {
        message = rawMessage;
      } else if (rawMessage is List) {
        errors.addAll(rawMessage.map(_stringify));
      } else if (rawMessage is Map) {
        errors.addAll(_flatten(rawMessage));
      }

      final rawErrors = data['errors'];
      if (rawErrors is List) {
        errors.addAll(rawErrors.map(_stringify));
      } else if (rawErrors is Map) {
        errors.addAll(_flatten(rawErrors));
      }
    } else if (data is String &&
        data.trim().isNotEmpty &&
        !data.trimLeft().startsWith('<')) {
      message = data;
    }

    return ApiErrorModel(
      message:
          message ?? (errors.isNotEmpty ? errors.first : _fallback(statusCode)),
      statusCode: statusCode,
      errors: errors,
    );
  }

  String get displayMessage => errors.isEmpty ? message : errors.join('\n');
}

String _stringify(dynamic value) {
  if (value is Map) {
    return (value['message'] ?? value.values.join(', ')).toString();
  }
  return value.toString();
}

List<String> _flatten(Map map) {
  final result = <String>[];
  for (final value in map.values) {
    if (value is List) {
      result.addAll(value.map(_stringify));
    } else {
      result.add(_stringify(value));
    }
  }
  return result;
}

String _fallback(int? statusCode) {
  switch (statusCode) {
    case 400:
      return 'Invalid request';
    case 401:
      return 'Unauthorized, please login again';
    case 403:
      return 'You do not have permission to do this';
    case 404:
      return 'Not found';
    case 409:
      return 'Already exists';
    default:
      if (statusCode != null && statusCode >= 500) {
        return 'Server error, please try again later';
      }
      return 'Something went wrong';
  }
}
