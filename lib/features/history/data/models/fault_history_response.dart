import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/json_helpers.dart';
import '../../../diagnose/data/models/fault_model.dart';

part 'fault_history_response.freezed.dart';
part 'fault_history_response.g.dart';

@freezed
abstract class FaultHistoryResponse with _$FaultHistoryResponse {
  const factory FaultHistoryResponse({
    String? message,
    @JsonKey(readValue: readList)
    @Default(<FaultModel>[])
    List<FaultModel> data,
  }) = _FaultHistoryResponse;

  factory FaultHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$FaultHistoryResponseFromJson(json);
}
