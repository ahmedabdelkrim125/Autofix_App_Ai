// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logout_request_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LogoutRequestBody {

 String get flag;
/// Create a copy of LogoutRequestBody
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogoutRequestBodyCopyWith<LogoutRequestBody> get copyWith => _$LogoutRequestBodyCopyWithImpl<LogoutRequestBody>(this as LogoutRequestBody, _$identity);

  /// Serializes this LogoutRequestBody to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoutRequestBody&&(identical(other.flag, flag) || other.flag == flag));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,flag);

@override
String toString() {
  return 'LogoutRequestBody(flag: $flag)';
}


}

/// @nodoc
abstract mixin class $LogoutRequestBodyCopyWith<$Res>  {
  factory $LogoutRequestBodyCopyWith(LogoutRequestBody value, $Res Function(LogoutRequestBody) _then) = _$LogoutRequestBodyCopyWithImpl;
@useResult
$Res call({
 String flag
});




}
/// @nodoc
class _$LogoutRequestBodyCopyWithImpl<$Res>
    implements $LogoutRequestBodyCopyWith<$Res> {
  _$LogoutRequestBodyCopyWithImpl(this._self, this._then);

  final LogoutRequestBody _self;
  final $Res Function(LogoutRequestBody) _then;

/// Create a copy of LogoutRequestBody
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? flag = null,}) {
  return _then(_self.copyWith(
flag: null == flag ? _self.flag : flag // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LogoutRequestBody].
extension LogoutRequestBodyPatterns on LogoutRequestBody {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LogoutRequestBody value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LogoutRequestBody() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LogoutRequestBody value)  $default,){
final _that = this;
switch (_that) {
case _LogoutRequestBody():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LogoutRequestBody value)?  $default,){
final _that = this;
switch (_that) {
case _LogoutRequestBody() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String flag)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LogoutRequestBody() when $default != null:
return $default(_that.flag);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String flag)  $default,) {final _that = this;
switch (_that) {
case _LogoutRequestBody():
return $default(_that.flag);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String flag)?  $default,) {final _that = this;
switch (_that) {
case _LogoutRequestBody() when $default != null:
return $default(_that.flag);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LogoutRequestBody implements LogoutRequestBody {
  const _LogoutRequestBody({this.flag = 'all'});
  factory _LogoutRequestBody.fromJson(Map<String, dynamic> json) => _$LogoutRequestBodyFromJson(json);

@override@JsonKey() final  String flag;

/// Create a copy of LogoutRequestBody
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogoutRequestBodyCopyWith<_LogoutRequestBody> get copyWith => __$LogoutRequestBodyCopyWithImpl<_LogoutRequestBody>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LogoutRequestBodyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogoutRequestBody&&(identical(other.flag, flag) || other.flag == flag));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,flag);

@override
String toString() {
  return 'LogoutRequestBody(flag: $flag)';
}


}

/// @nodoc
abstract mixin class _$LogoutRequestBodyCopyWith<$Res> implements $LogoutRequestBodyCopyWith<$Res> {
  factory _$LogoutRequestBodyCopyWith(_LogoutRequestBody value, $Res Function(_LogoutRequestBody) _then) = __$LogoutRequestBodyCopyWithImpl;
@override @useResult
$Res call({
 String flag
});




}
/// @nodoc
class __$LogoutRequestBodyCopyWithImpl<$Res>
    implements _$LogoutRequestBodyCopyWith<$Res> {
  __$LogoutRequestBodyCopyWithImpl(this._self, this._then);

  final _LogoutRequestBody _self;
  final $Res Function(_LogoutRequestBody) _then;

/// Create a copy of LogoutRequestBody
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? flag = null,}) {
  return _then(_LogoutRequestBody(
flag: null == flag ? _self.flag : flag // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
