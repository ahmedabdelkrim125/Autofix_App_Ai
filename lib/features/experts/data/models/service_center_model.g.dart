// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_center_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceCenterModel _$ServiceCenterModelFromJson(Map<String, dynamic> json) =>
    _ServiceCenterModel(
      id: readId(json, 'id') as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      address: _readAddress(json, 'address') as String?,
      city: _readCity(json, 'city') as String?,
      specialties: (json['specialties'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      workingHours: json['workingHours'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      ratingsCount: (json['ratingsCount'] as num?)?.toInt(),
      distanceKm: (json['distanceKm'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ServiceCenterModelToJson(_ServiceCenterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'city': instance.city,
      'specialties': instance.specialties,
      'workingHours': instance.workingHours,
      'rating': instance.rating,
      'ratingsCount': instance.ratingsCount,
      'distanceKm': instance.distanceKm,
    };
