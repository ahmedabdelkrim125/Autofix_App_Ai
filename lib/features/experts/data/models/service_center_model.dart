import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/json_helpers.dart';

part 'service_center_model.freezed.dart';
part 'service_center_model.g.dart';

Object? _readAddress(Map<dynamic, dynamic> json, String key) {
  final location = json['location'];
  return location is Map ? location['address'] : json['address'];
}

Object? _readCity(Map<dynamic, dynamic> json, String key) {
  final location = json['location'];
  return location is Map ? location['city'] : json['city'];
}

@freezed
abstract class ServiceCenterModel with _$ServiceCenterModel {
  const factory ServiceCenterModel({
    @JsonKey(readValue: readId) String? id,
    String? name,
    String? phone,
    @JsonKey(readValue: _readAddress) String? address,
    @JsonKey(readValue: _readCity) String? city,
    List<String>? specialties,
    String? workingHours,
    double? rating,
    int? ratingsCount,
    double? distanceKm,
  }) = _ServiceCenterModel;

  factory ServiceCenterModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceCenterModelFromJson(json);
}
