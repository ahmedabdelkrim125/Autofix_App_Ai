import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_model.dart';

part 'profile_response.freezed.dart';
part 'profile_response.g.dart';

Object? _readUser(Map<dynamic, dynamic> json, String key) {
  final data = json['data'];
  if (data is Map && data['user'] is Map) return data['user'];
  return data;
}

@freezed
abstract class ProfileResponse with _$ProfileResponse {
  const factory ProfileResponse({
    String? message,
    @JsonKey(readValue: _readUser) UserModel? data,
  }) = _ProfileResponse;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);
}
