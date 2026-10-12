// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_request_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignupRequestBody {

 String get name; String get email; String get phone; String get password; String get confirmPassword; LocationModel get location;
/// Create a copy of SignupRequestBody
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupRequestBodyCopyWith<SignupRequestBody> get copyWith => _$SignupRequestBodyCopyWithImpl<SignupRequestBody>(this as SignupRequestBody, _$identity);

  /// Serializes this SignupRequestBody to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupRequestBody&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email,phone,password,confirmPassword,location);

@override
String toString() {
  return 'SignupRequestBody(name: $name, email: $email, phone: $phone, password: $password, confirmPassword: $confirmPassword, location: $location)';
}


}

/// @nodoc
abstract mixin class $SignupRequestBodyCopyWith<$Res>  {
  factory $SignupRequestBodyCopyWith(SignupRequestBody value, $Res Function(SignupRequestBody) _then) = _$SignupRequestBodyCopyWithImpl;
@useResult
$Res call({
 String name, String email, String phone, String password, String confirmPassword, LocationModel location
});


$LocationModelCopyWith<$Res> get location;

}
/// @nodoc
class _$SignupRequestBodyCopyWithImpl<$Res>
    implements $SignupRequestBodyCopyWith<$Res> {
  _$SignupRequestBodyCopyWithImpl(this._self, this._then);

  final SignupRequestBody _self;
  final $Res Function(SignupRequestBody) _then;

/// Create a copy of SignupRequestBody
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? email = null,Object? phone = null,Object? password = null,Object? confirmPassword = null,Object? location = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as LocationModel,
  ));
}
/// Create a copy of SignupRequestBody
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationModelCopyWith<$Res> get location {
  
  return $LocationModelCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// Adds pattern-matching-related methods to [SignupRequestBody].
extension SignupRequestBodyPatterns on SignupRequestBody {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignupRequestBody value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignupRequestBody() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignupRequestBody value)  $default,){
final _that = this;
switch (_that) {
case _SignupRequestBody():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignupRequestBody value)?  $default,){
final _that = this;
switch (_that) {
case _SignupRequestBody() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String email,  String phone,  String password,  String confirmPassword,  LocationModel location)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignupRequestBody() when $default != null:
return $default(_that.name,_that.email,_that.phone,_that.password,_that.confirmPassword,_that.location);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String email,  String phone,  String password,  String confirmPassword,  LocationModel location)  $default,) {final _that = this;
switch (_that) {
case _SignupRequestBody():
return $default(_that.name,_that.email,_that.phone,_that.password,_that.confirmPassword,_that.location);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String email,  String phone,  String password,  String confirmPassword,  LocationModel location)?  $default,) {final _that = this;
switch (_that) {
case _SignupRequestBody() when $default != null:
return $default(_that.name,_that.email,_that.phone,_that.password,_that.confirmPassword,_that.location);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _SignupRequestBody implements SignupRequestBody {
  const _SignupRequestBody({required this.name, required this.email, required this.phone, required this.password, required this.confirmPassword, required this.location});
  factory _SignupRequestBody.fromJson(Map<String, dynamic> json) => _$SignupRequestBodyFromJson(json);

@override final  String name;
@override final  String email;
@override final  String phone;
@override final  String password;
@override final  String confirmPassword;
@override final  LocationModel location;

/// Create a copy of SignupRequestBody
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignupRequestBodyCopyWith<_SignupRequestBody> get copyWith => __$SignupRequestBodyCopyWithImpl<_SignupRequestBody>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SignupRequestBodyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignupRequestBody&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email,phone,password,confirmPassword,location);

@override
String toString() {
  return 'SignupRequestBody(name: $name, email: $email, phone: $phone, password: $password, confirmPassword: $confirmPassword, location: $location)';
}


}

/// @nodoc
abstract mixin class _$SignupRequestBodyCopyWith<$Res> implements $SignupRequestBodyCopyWith<$Res> {
  factory _$SignupRequestBodyCopyWith(_SignupRequestBody value, $Res Function(_SignupRequestBody) _then) = __$SignupRequestBodyCopyWithImpl;
@override @useResult
$Res call({
 String name, String email, String phone, String password, String confirmPassword, LocationModel location
});


@override $LocationModelCopyWith<$Res> get location;

}
/// @nodoc
class __$SignupRequestBodyCopyWithImpl<$Res>
    implements _$SignupRequestBodyCopyWith<$Res> {
  __$SignupRequestBodyCopyWithImpl(this._self, this._then);

  final _SignupRequestBody _self;
  final $Res Function(_SignupRequestBody) _then;

/// Create a copy of SignupRequestBody
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? email = null,Object? phone = null,Object? password = null,Object? confirmPassword = null,Object? location = null,}) {
  return _then(_SignupRequestBody(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as LocationModel,
  ));
}

/// Create a copy of SignupRequestBody
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationModelCopyWith<$Res> get location {
  
  return $LocationModelCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}

// dart format on
