import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/models/location_model.dart';

part 'signup_request_body.freezed.dart';
part 'signup_request_body.g.dart';

@freezed
abstract class SignupRequestBody with _$SignupRequestBody {
  @JsonSerializable(explicitToJson: true)
  const factory SignupRequestBody({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
    required LocationModel location,
  }) = _SignupRequestBody;

  factory SignupRequestBody.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestBodyFromJson(json);
}
