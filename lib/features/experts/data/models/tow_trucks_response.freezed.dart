// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tow_trucks_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TowTrucksResponse {

 String? get message;@JsonKey(readValue: readList) List<TowTruckModel> get data;
/// Create a copy of TowTrucksResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TowTrucksResponseCopyWith<TowTrucksResponse> get copyWith => _$TowTrucksResponseCopyWithImpl<TowTrucksResponse>(this as TowTrucksResponse, _$identity);

  /// Serializes this TowTrucksResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TowTrucksResponse&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'TowTrucksResponse(message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $TowTrucksResponseCopyWith<$Res>  {
  factory $TowTrucksResponseCopyWith(TowTrucksResponse value, $Res Function(TowTrucksResponse) _then) = _$TowTrucksResponseCopyWithImpl;
@useResult
$Res call({
 String? message,@JsonKey(readValue: readList) List<TowTruckModel> data
});




}
/// @nodoc
class _$TowTrucksResponseCopyWithImpl<$Res>
    implements $TowTrucksResponseCopyWith<$Res> {
  _$TowTrucksResponseCopyWithImpl(this._self, this._then);

  final TowTrucksResponse _self;
  final $Res Function(TowTrucksResponse) _then;

/// Create a copy of TowTrucksResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = freezed,Object? data = null,}) {
  return _then(_self.copyWith(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<TowTruckModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [TowTrucksResponse].
extension TowTrucksResponsePatterns on TowTrucksResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TowTrucksResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TowTrucksResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TowTrucksResponse value)  $default,){
final _that = this;
switch (_that) {
case _TowTrucksResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TowTrucksResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TowTrucksResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? message, @JsonKey(readValue: readList)  List<TowTruckModel> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TowTrucksResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? message, @JsonKey(readValue: readList)  List<TowTruckModel> data)  $default,) {final _that = this;
switch (_that) {
case _TowTrucksResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? message, @JsonKey(readValue: readList)  List<TowTruckModel> data)?  $default,) {final _that = this;
switch (_that) {
case _TowTrucksResponse() when $default != null:
return $default(_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TowTrucksResponse implements TowTrucksResponse {
  const _TowTrucksResponse({this.message, @JsonKey(readValue: readList) final  List<TowTruckModel> data = const <TowTruckModel>[]}): _data = data;
  factory _TowTrucksResponse.fromJson(Map<String, dynamic> json) => _$TowTrucksResponseFromJson(json);

@override final  String? message;
 final  List<TowTruckModel> _data;
@override@JsonKey(readValue: readList) List<TowTruckModel> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of TowTrucksResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TowTrucksResponseCopyWith<_TowTrucksResponse> get copyWith => __$TowTrucksResponseCopyWithImpl<_TowTrucksResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TowTrucksResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TowTrucksResponse&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'TowTrucksResponse(message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$TowTrucksResponseCopyWith<$Res> implements $TowTrucksResponseCopyWith<$Res> {
  factory _$TowTrucksResponseCopyWith(_TowTrucksResponse value, $Res Function(_TowTrucksResponse) _then) = __$TowTrucksResponseCopyWithImpl;
@override @useResult
$Res call({
 String? message,@JsonKey(readValue: readList) List<TowTruckModel> data
});




}
/// @nodoc
class __$TowTrucksResponseCopyWithImpl<$Res>
    implements _$TowTrucksResponseCopyWith<$Res> {
  __$TowTrucksResponseCopyWithImpl(this._self, this._then);

  final _TowTrucksResponse _self;
  final $Res Function(_TowTrucksResponse) _then;

/// Create a copy of TowTrucksResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? data = null,}) {
  return _then(_TowTrucksResponse(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<TowTruckModel>,
  ));
}


}

// dart format on
