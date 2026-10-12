import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/json_helpers.dart';
import 'service_center_model.dart';

part 'service_centers_response.freezed.dart';
part 'service_centers_response.g.dart';

@freezed
abstract class ServiceCentersResponse with _$ServiceCentersResponse {
  const factory ServiceCentersResponse({
    String? message,
    @JsonKey(readValue: readList)
    @Default(<ServiceCenterModel>[])
    List<ServiceCenterModel> data,
  }) = _ServiceCentersResponse;

  factory ServiceCentersResponse.fromJson(Map<String, dynamic> json) =>
      _$ServiceCentersResponseFromJson(json);
}
