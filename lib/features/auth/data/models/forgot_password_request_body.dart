import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_request_body.freezed.dart';
part 'forgot_password_request_body.g.dart';

@freezed
abstract class ForgotPasswordRequestBody with _$ForgotPasswordRequestBody {
  const factory ForgotPasswordRequestBody({required String email}) =
      _ForgotPasswordRequestBody;

  factory ForgotPasswordRequestBody.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordRequestBodyFromJson(json);
}
