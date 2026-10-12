// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tow_trucks_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TowTrucksResponse _$TowTrucksResponseFromJson(Map<String, dynamic> json) =>
    _TowTrucksResponse(
      message: json['message'] as String?,
      data:
          (readList(json, 'data') as List<dynamic>?)
              ?.map((e) => TowTruckModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <TowTruckModel>[],
    );

Map<String, dynamic> _$TowTrucksResponseToJson(_TowTrucksResponse instance) =>
    <String, dynamic>{'message': instance.message, 'data': instance.data};
