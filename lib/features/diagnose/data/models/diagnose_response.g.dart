// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diagnose_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DiagnoseResponse _$DiagnoseResponseFromJson(Map<String, dynamic> json) =>
    _DiagnoseResponse(
      message: json['message'] as String?,
      data: _readFault(json, 'data') == null
          ? null
          : FaultModel.fromJson(
              _readFault(json, 'data') as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$DiagnoseResponseToJson(_DiagnoseResponse instance) =>
    <String, dynamic>{'message': instance.message, 'data': instance.data};
