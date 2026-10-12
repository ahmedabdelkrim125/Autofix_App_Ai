// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refresh_token_request_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RefreshTokenRequestBody {

 String get refreshToken;
/// Create a copy of RefreshTokenRequestBody
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefreshTokenRequestBodyCopyWith<RefreshTokenRequestBody> get copyWith => _$RefreshTokenRequestBodyCopyWithImpl<RefreshTokenRequestBody>(this as RefreshTokenRequestBody, _$identity);

  /// Serializes this RefreshTokenRequestBody to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshTokenRequestBody&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,refreshToken);

@override
String toString() {
  return 'RefreshTokenRequestBody(refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class $RefreshTokenRequestBodyCopyWith<$Res>  {
  factory $RefreshTokenRequestBodyCopyWith(RefreshTokenRequestBody value, $Res Function(RefreshTokenRequestBody) _then) = _$RefreshTokenRequestBodyCopyWithImpl;
@useResult
$Res call({
 String refreshToken
});




}
/// @nodoc
class _$RefreshTokenRequestBodyCopyWithImpl<$Res>
    implements $RefreshTokenRequestBodyCopyWith<$Res> {
  _$RefreshTokenRequestBodyCopyWithImpl(this._self, this._then);

  final RefreshTokenRequestBody _self;
  final $Res Function(RefreshTokenRequestBody) _then;

/// Create a copy of RefreshTokenRequestBody
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? refreshToken = null,}) {
  return _then(_self.copyWith(
refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RefreshTokenRequestBody].
extension RefreshTokenRequestBodyPatterns on RefreshTokenRequestBody {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RefreshTokenRequestBody value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RefreshTokenRequestBody() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RefreshTokenRequestBody value)  $default,){
final _that = this;
switch (_that) {
case _RefreshTokenRequestBody():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RefreshTokenRequestBody value)?  $default,){
final _that = this;
switch (_that) {
case _RefreshTokenRequestBody() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String refreshToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RefreshTokenRequestBody() when $default != null:
return $default(_that.refreshToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String refreshToken)  $default,) {final _that = this;
switch (_that) {
case _RefreshTokenRequestBody():
return $default(_that.refreshToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String refreshToken)?  $default,) {final _that = this;
switch (_that) {
case _RefreshTokenRequestBody() when $default != null:
return $default(_that.refreshToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RefreshTokenRequestBody implements RefreshTokenRequestBody {
  const _RefreshTokenRequestBody({required this.refreshToken});
  factory _RefreshTokenRequestBody.fromJson(Map<String, dynamic> json) => _$RefreshTokenRequestBodyFromJson(json);

@override final  String refreshToken;

/// Create a copy of RefreshTokenRequestBody
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefreshTokenRequestBodyCopyWith<_RefreshTokenRequestBody> get copyWith => __$RefreshTokenRequestBodyCopyWithImpl<_RefreshTokenRequestBody>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RefreshTokenRequestBodyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshTokenRequestBody&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,refreshToken);

@override
String toString() {
  return 'RefreshTokenRequestBody(refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class _$RefreshTokenRequestBodyCopyWith<$Res> implements $RefreshTokenRequestBodyCopyWith<$Res> {
  factory _$RefreshTokenRequestBodyCopyWith(_RefreshTokenRequestBody value, $Res Function(_RefreshTokenRequestBody) _then) = __$RefreshTokenRequestBodyCopyWithImpl;
@override @useResult
$Res call({
 String refreshToken
});




}
/// @nodoc
class __$RefreshTokenRequestBodyCopyWithImpl<$Res>
    implements _$RefreshTokenRequestBodyCopyWith<$Res> {
  __$RefreshTokenRequestBodyCopyWithImpl(this._self, this._then);

  final _RefreshTokenRequestBody _self;
  final $Res Function(_RefreshTokenRequestBody) _then;

/// Create a copy of RefreshTokenRequestBody
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? refreshToken = null,}) {
  return _then(_RefreshTokenRequestBody(
refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
