// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fault_history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FaultHistoryResponse _$FaultHistoryResponseFromJson(
  Map<String, dynamic> json,
) => _FaultHistoryResponse(
  message: json['message'] as String?,
  data:
      (readList(json, 'data') as List<dynamic>?)
          ?.map((e) => FaultModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <FaultModel>[],
);

Map<String, dynamic> _$FaultHistoryResponseToJson(
  _FaultHistoryResponse instance,
) => <String, dynamic>{'message': instance.message, 'data': instance.data};
