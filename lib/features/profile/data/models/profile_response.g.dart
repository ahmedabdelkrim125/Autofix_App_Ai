// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    _ProfileResponse(
      message: json['message'] as String?,
      data: _readUser(json, 'data') == null
          ? null
          : UserModel.fromJson(_readUser(json, 'data') as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileResponseToJson(_ProfileResponse instance) =>
    <String, dynamic>{'message': instance.message, 'data': instance.data};
