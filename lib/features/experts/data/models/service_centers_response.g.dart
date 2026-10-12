// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_centers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceCentersResponse _$ServiceCentersResponseFromJson(
  Map<String, dynamic> json,
) => _ServiceCentersResponse(
  message: json['message'] as String?,
  data:
      (readList(json, 'data') as List<dynamic>?)
          ?.map((e) => ServiceCenterModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ServiceCenterModel>[],
);

Map<String, dynamic> _$ServiceCentersResponseToJson(
  _ServiceCentersResponse instance,
) => <String, dynamic>{'message': instance.message, 'data': instance.data};
