// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SignupRequestBody _$SignupRequestBodyFromJson(Map<String, dynamic> json) =>
    _SignupRequestBody(
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      password: json['password'] as String,
      confirmPassword: json['confirmPassword'] as String,
      location: LocationModel.fromJson(
        json['location'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$SignupRequestBodyToJson(_SignupRequestBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
      'location': instance.location.toJson(),
    };
