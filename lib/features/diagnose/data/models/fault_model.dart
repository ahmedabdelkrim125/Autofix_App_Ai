import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/json_helpers.dart';

part 'fault_model.freezed.dart';
part 'fault_model.g.dart';

@freezed
abstract class FaultModel with _$FaultModel {
  const FaultModel._();

  const factory FaultModel({
    @JsonKey(readValue: readId) String? id,
    String? faultType,
    String? faultText,
    String? difficulty,
    String? status,
    String? createdAt,
    @JsonKey(readValue: readSelf) Map<String, dynamic>? raw,
  }) = _FaultModel;

  factory FaultModel.fromJson(Map<String, dynamic> json) =>
      _$FaultModelFromJson(json);

  String get title {
    final text = faultText?.trim();
    if (text != null && text.isNotEmpty) return text;
    for (final key in const ['title', 'problem', 'name', 'diagnosis']) {
      final value = raw?[key];
      if (value is String && value.trim().isNotEmpty) return value.trim();
    }
    return faultType == 'image' ? 'Photo diagnosis' : 'Diagnosis';
  }

  DateTime? get date {
    final value = createdAt;
    return value == null ? null : DateTime.tryParse(value)?.toLocal();
  }
}
