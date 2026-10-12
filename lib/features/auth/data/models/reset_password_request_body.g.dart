// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResetPasswordRequestBody _$ResetPasswordRequestBodyFromJson(
  Map<String, dynamic> json,
) => _ResetPasswordRequestBody(
  email: json['email'] as String,
  otp: json['otp'] as String,
  password: json['password'] as String,
  confirmPassword: json['confirmPassword'] as String,
);

Map<String, dynamic> _$ResetPasswordRequestBodyToJson(
  _ResetPasswordRequestBody instance,
) => <String, dynamic>{
  'email': instance.email,
  'otp': instance.otp,
  'password': instance.password,
  'confirmPassword': instance.confirmPassword,
};
