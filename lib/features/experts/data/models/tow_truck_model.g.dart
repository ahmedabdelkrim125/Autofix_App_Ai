// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tow_truck_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TowTruckModel _$TowTruckModelFromJson(Map<String, dynamic> json) =>
    _TowTruckModel(
      id: readId(json, 'id') as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      isAvailable: json['isAvailable'] as bool?,
      rating: (json['rating'] as num?)?.toDouble(),
      ratingsCount: (json['ratingsCount'] as num?)?.toInt(),
      distanceKm: (json['distanceKm'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TowTruckModelToJson(_TowTruckModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'isAvailable': instance.isAvailable,
      'rating': instance.rating,
      'ratingsCount': instance.ratingsCount,
      'distanceKm': instance.distanceKm,
    };
