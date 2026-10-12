import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_request_body.freezed.dart';
part 'reset_password_request_body.g.dart';

@freezed
abstract class ResetPasswordRequestBody with _$ResetPasswordRequestBody {
  const factory ResetPasswordRequestBody({
    required String email,
    required String otp,
    required String password,
    required String confirmPassword,
  }) = _ResetPasswordRequestBody;

  factory ResetPasswordRequestBody.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordRequestBodyFromJson(json);
}
