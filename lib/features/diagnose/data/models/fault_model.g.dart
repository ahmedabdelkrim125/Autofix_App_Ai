// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fault_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FaultModel _$FaultModelFromJson(Map<String, dynamic> json) => _FaultModel(
  id: readId(json, 'id') as String?,
  faultType: json['faultType'] as String?,
  faultText: json['faultText'] as String?,
  difficulty: json['difficulty'] as String?,
  status: json['status'] as String?,
  createdAt: json['createdAt'] as String?,
  raw: readSelf(json, 'raw') as Map<String, dynamic>?,
);

Map<String, dynamic> _$FaultModelToJson(_FaultModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'faultType': instance.faultType,
      'faultText': instance.faultText,
      'difficulty': instance.difficulty,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'raw': instance.raw,
    };
