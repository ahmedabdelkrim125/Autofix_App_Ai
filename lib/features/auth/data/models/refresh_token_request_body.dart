import 'package:freezed_annotation/freezed_annotation.dart';

part 'refresh_token_request_body.freezed.dart';
part 'refresh_token_request_body.g.dart';

@freezed
abstract class RefreshTokenRequestBody with _$RefreshTokenRequestBody {
  const factory RefreshTokenRequestBody({required String refreshToken}) =
      _RefreshTokenRequestBody;

  factory RefreshTokenRequestBody.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenRequestBodyFromJson(json);
}
