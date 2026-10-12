import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/json_helpers.dart';

part 'tow_truck_model.freezed.dart';
part 'tow_truck_model.g.dart';

@freezed
abstract class TowTruckModel with _$TowTruckModel {
  const factory TowTruckModel({
    @JsonKey(readValue: readId) String? id,
    String? name,
    String? phone,
    bool? isAvailable,
    double? rating,
    int? ratingsCount,
    double? distanceKm,
  }) = _TowTruckModel;

  factory TowTruckModel.fromJson(Map<String, dynamic> json) =>
      _$TowTruckModelFromJson(json);
}
