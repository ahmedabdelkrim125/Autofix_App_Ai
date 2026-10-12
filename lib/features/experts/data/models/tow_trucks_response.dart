import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/json_helpers.dart';
import 'tow_truck_model.dart';

part 'tow_trucks_response.freezed.dart';
part 'tow_trucks_response.g.dart';

@freezed
abstract class TowTrucksResponse with _$TowTrucksResponse {
  const factory TowTrucksResponse({
    String? message,
    @JsonKey(readValue: readList)
    @Default(<TowTruckModel>[])
    List<TowTruckModel> data,
  }) = _TowTrucksResponse;

  factory TowTrucksResponse.fromJson(Map<String, dynamic> json) =>
      _$TowTrucksResponseFromJson(json);
}
