import 'package:freezed_annotation/freezed_annotation.dart';
import 'fault_model.dart';

part 'diagnose_response.freezed.dart';
part 'diagnose_response.g.dart';

Object? _readFault(Map<dynamic, dynamic> json, String key) {
  final data = json['data'];
  if (data is Map) {
    if (data['fault'] is Map) return data['fault'];
    return data;
  }
  return json;
}

@freezed
abstract class DiagnoseResponse with _$DiagnoseResponse {
  const factory DiagnoseResponse({
    String? message,
    @JsonKey(readValue: _readFault) FaultModel? data,
  }) = _DiagnoseResponse;

  factory DiagnoseResponse.fromJson(Map<String, dynamic> json) =>
      _$DiagnoseResponseFromJson(json);
}
