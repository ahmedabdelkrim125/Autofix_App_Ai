// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fault_history_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FaultHistoryResponse {

 String? get message;@JsonKey(readValue: readList) List<FaultModel> get data;
/// Create a copy of FaultHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaultHistoryResponseCopyWith<FaultHistoryResponse> get copyWith => _$FaultHistoryResponseCopyWithImpl<FaultHistoryResponse>(this as FaultHistoryResponse, _$identity);

  /// Serializes this FaultHistoryResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaultHistoryResponse&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'FaultHistoryResponse(message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $FaultHistoryResponseCopyWith<$Res>  {
  factory $FaultHistoryResponseCopyWith(FaultHistoryResponse value, $Res Function(FaultHistoryResponse) _then) = _$FaultHistoryResponseCopyWithImpl;
@useResult
$Res call({
 String? message,@JsonKey(readValue: readList) List<FaultModel> data
});




}
/// @nodoc
class _$FaultHistoryResponseCopyWithImpl<$Res>
    implements $FaultHistoryResponseCopyWith<$Res> {
  _$FaultHistoryResponseCopyWithImpl(this._self, this._then);

  final FaultHistoryResponse _self;
  final $Res Function(FaultHistoryResponse) _then;

/// Create a copy of FaultHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = freezed,Object? data = null,}) {
  return _then(_self.copyWith(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<FaultModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [FaultHistoryResponse].
extension FaultHistoryResponsePatterns on FaultHistoryResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FaultHistoryResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FaultHistoryResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FaultHistoryResponse value)  $default,){
final _that = this;
switch (_that) {
case _FaultHistoryResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FaultHistoryResponse value)?  $default,){
final _that = this;
switch (_that) {
case _FaultHistoryResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? message, @JsonKey(readValue: readList)  List<FaultModel> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FaultHistoryResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? message, @JsonKey(readValue: readList)  List<FaultModel> data)  $default,) {final _that = this;
switch (_that) {
case _FaultHistoryResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? message, @JsonKey(readValue: readList)  List<FaultModel> data)?  $default,) {final _that = this;
switch (_that) {
case _FaultHistoryResponse() when $default != null:
return $default(_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FaultHistoryResponse implements FaultHistoryResponse {
  const _FaultHistoryResponse({this.message, @JsonKey(readValue: readList) final  List<FaultModel> data = const <FaultModel>[]}): _data = data;
  factory _FaultHistoryResponse.fromJson(Map<String, dynamic> json) => _$FaultHistoryResponseFromJson(json);

@override final  String? message;
 final  List<FaultModel> _data;
@override@JsonKey(readValue: readList) List<FaultModel> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of FaultHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FaultHistoryResponseCopyWith<_FaultHistoryResponse> get copyWith => __$FaultHistoryResponseCopyWithImpl<_FaultHistoryResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FaultHistoryResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FaultHistoryResponse&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'FaultHistoryResponse(message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$FaultHistoryResponseCopyWith<$Res> implements $FaultHistoryResponseCopyWith<$Res> {
  factory _$FaultHistoryResponseCopyWith(_FaultHistoryResponse value, $Res Function(_FaultHistoryResponse) _then) = __$FaultHistoryResponseCopyWithImpl;
@override @useResult
$Res call({
 String? message,@JsonKey(readValue: readList) List<FaultModel> data
});




}
/// @nodoc
class __$FaultHistoryResponseCopyWithImpl<$Res>
    implements _$FaultHistoryResponseCopyWith<$Res> {
  __$FaultHistoryResponseCopyWithImpl(this._self, this._then);

  final _FaultHistoryResponse _self;
  final $Res Function(_FaultHistoryResponse) _then;

/// Create a copy of FaultHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? data = null,}) {
  return _then(_FaultHistoryResponse(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<FaultModel>,
  ));
}


}

// dart format on
