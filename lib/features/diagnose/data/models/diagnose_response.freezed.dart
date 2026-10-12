// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diagnose_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DiagnoseResponse {

 String? get message;@JsonKey(readValue: _readFault) FaultModel? get data;
/// Create a copy of DiagnoseResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiagnoseResponseCopyWith<DiagnoseResponse> get copyWith => _$DiagnoseResponseCopyWithImpl<DiagnoseResponse>(this as DiagnoseResponse, _$identity);

  /// Serializes this DiagnoseResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiagnoseResponse&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,data);

@override
String toString() {
  return 'DiagnoseResponse(message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $DiagnoseResponseCopyWith<$Res>  {
  factory $DiagnoseResponseCopyWith(DiagnoseResponse value, $Res Function(DiagnoseResponse) _then) = _$DiagnoseResponseCopyWithImpl;
@useResult
$Res call({
 String? message,@JsonKey(readValue: _readFault) FaultModel? data
});


$FaultModelCopyWith<$Res>? get data;

}
/// @nodoc
class _$DiagnoseResponseCopyWithImpl<$Res>
    implements $DiagnoseResponseCopyWith<$Res> {
  _$DiagnoseResponseCopyWithImpl(this._self, this._then);

  final DiagnoseResponse _self;
  final $Res Function(DiagnoseResponse) _then;

/// Create a copy of DiagnoseResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as FaultModel?,
  ));
}
/// Create a copy of DiagnoseResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FaultModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $FaultModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [DiagnoseResponse].
extension DiagnoseResponsePatterns on DiagnoseResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DiagnoseResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DiagnoseResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DiagnoseResponse value)  $default,){
final _that = this;
switch (_that) {
case _DiagnoseResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DiagnoseResponse value)?  $default,){
final _that = this;
switch (_that) {
case _DiagnoseResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? message, @JsonKey(readValue: _readFault)  FaultModel? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DiagnoseResponse() when $default != null:
return $default(_that.message,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? message, @JsonKey(readValue: _readFault)  FaultModel? data)  $default,) {final _that = this;
switch (_that) {
case _DiagnoseResponse():
return $default(_that.message,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? message, @JsonKey(readValue: _readFault)  FaultModel? data)?  $default,) {final _that = this;
switch (_that) {
case _DiagnoseResponse() when $default != null:
return $default(_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DiagnoseResponse implements DiagnoseResponse {
  const _DiagnoseResponse({this.message, @JsonKey(readValue: _readFault) this.data});
  factory _DiagnoseResponse.fromJson(Map<String, dynamic> json) => _$DiagnoseResponseFromJson(json);

@override final  String? message;
@override@JsonKey(readValue: _readFault) final  FaultModel? data;

/// Create a copy of DiagnoseResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiagnoseResponseCopyWith<_DiagnoseResponse> get copyWith => __$DiagnoseResponseCopyWithImpl<_DiagnoseResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DiagnoseResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiagnoseResponse&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,data);

@override
String toString() {
  return 'DiagnoseResponse(message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$DiagnoseResponseCopyWith<$Res> implements $DiagnoseResponseCopyWith<$Res> {
  factory _$DiagnoseResponseCopyWith(_DiagnoseResponse value, $Res Function(_DiagnoseResponse) _then) = __$DiagnoseResponseCopyWithImpl;
@override @useResult
$Res call({
 String? message,@JsonKey(readValue: _readFault) FaultModel? data
});


@override $FaultModelCopyWith<$Res>? get data;

}
/// @nodoc
class __$DiagnoseResponseCopyWithImpl<$Res>
    implements _$DiagnoseResponseCopyWith<$Res> {
  __$DiagnoseResponseCopyWithImpl(this._self, this._then);

  final _DiagnoseResponse _self;
  final $Res Function(_DiagnoseResponse) _then;

/// Create a copy of DiagnoseResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? data = freezed,}) {
  return _then(_DiagnoseResponse(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as FaultModel?,
  ));
}

/// Create a copy of DiagnoseResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FaultModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $FaultModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
