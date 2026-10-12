// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_request_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResetPasswordRequestBody {

 String get email; String get otp; String get password; String get confirmPassword;
/// Create a copy of ResetPasswordRequestBody
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResetPasswordRequestBodyCopyWith<ResetPasswordRequestBody> get copyWith => _$ResetPasswordRequestBodyCopyWithImpl<ResetPasswordRequestBody>(this as ResetPasswordRequestBody, _$identity);

  /// Serializes this ResetPasswordRequestBody to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPasswordRequestBody&&(identical(other.email, email) || other.email == email)&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,otp,password,confirmPassword);

@override
String toString() {
  return 'ResetPasswordRequestBody(email: $email, otp: $otp, password: $password, confirmPassword: $confirmPassword)';
}


}

/// @nodoc
abstract mixin class $ResetPasswordRequestBodyCopyWith<$Res>  {
  factory $ResetPasswordRequestBodyCopyWith(ResetPasswordRequestBody value, $Res Function(ResetPasswordRequestBody) _then) = _$ResetPasswordRequestBodyCopyWithImpl;
@useResult
$Res call({
 String email, String otp, String password, String confirmPassword
});




}
/// @nodoc
class _$ResetPasswordRequestBodyCopyWithImpl<$Res>
    implements $ResetPasswordRequestBodyCopyWith<$Res> {
  _$ResetPasswordRequestBodyCopyWithImpl(this._self, this._then);

  final ResetPasswordRequestBody _self;
  final $Res Function(ResetPasswordRequestBody) _then;

/// Create a copy of ResetPasswordRequestBody
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? otp = null,Object? password = null,Object? confirmPassword = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ResetPasswordRequestBody].
extension ResetPasswordRequestBodyPatterns on ResetPasswordRequestBody {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResetPasswordRequestBody value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResetPasswordRequestBody() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResetPasswordRequestBody value)  $default,){
final _that = this;
switch (_that) {
case _ResetPasswordRequestBody():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResetPasswordRequestBody value)?  $default,){
final _that = this;
switch (_that) {
case _ResetPasswordRequestBody() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email,  String otp,  String password,  String confirmPassword)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResetPasswordRequestBody() when $default != null:
return $default(_that.email,_that.otp,_that.password,_that.confirmPassword);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email,  String otp,  String password,  String confirmPassword)  $default,) {final _that = this;
switch (_that) {
case _ResetPasswordRequestBody():
return $default(_that.email,_that.otp,_that.password,_that.confirmPassword);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email,  String otp,  String password,  String confirmPassword)?  $default,) {final _that = this;
switch (_that) {
case _ResetPasswordRequestBody() when $default != null:
return $default(_that.email,_that.otp,_that.password,_that.confirmPassword);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResetPasswordRequestBody implements ResetPasswordRequestBody {
  const _ResetPasswordRequestBody({required this.email, required this.otp, required this.password, required this.confirmPassword});
  factory _ResetPasswordRequestBody.fromJson(Map<String, dynamic> json) => _$ResetPasswordRequestBodyFromJson(json);

@override final  String email;
@override final  String otp;
@override final  String password;
@override final  String confirmPassword;

/// Create a copy of ResetPasswordRequestBody
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResetPasswordRequestBodyCopyWith<_ResetPasswordRequestBody> get copyWith => __$ResetPasswordRequestBodyCopyWithImpl<_ResetPasswordRequestBody>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResetPasswordRequestBodyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResetPasswordRequestBody&&(identical(other.email, email) || other.email == email)&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,otp,password,confirmPassword);

@override
String toString() {
  return 'ResetPasswordRequestBody(email: $email, otp: $otp, password: $password, confirmPassword: $confirmPassword)';
}


}

/// @nodoc
abstract mixin class _$ResetPasswordRequestBodyCopyWith<$Res> implements $ResetPasswordRequestBodyCopyWith<$Res> {
  factory _$ResetPasswordRequestBodyCopyWith(_ResetPasswordRequestBody value, $Res Function(_ResetPasswordRequestBody) _then) = __$ResetPasswordRequestBodyCopyWithImpl;
@override @useResult
$Res call({
 String email, String otp, String password, String confirmPassword
});




}
/// @nodoc
class __$ResetPasswordRequestBodyCopyWithImpl<$Res>
    implements _$ResetPasswordRequestBodyCopyWith<$Res> {
  __$ResetPasswordRequestBodyCopyWithImpl(this._self, this._then);

  final _ResetPasswordRequestBody _self;
  final $Res Function(_ResetPasswordRequestBody) _then;

/// Create a copy of ResetPasswordRequestBody
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? otp = null,Object? password = null,Object? confirmPassword = null,}) {
  return _then(_ResetPasswordRequestBody(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
