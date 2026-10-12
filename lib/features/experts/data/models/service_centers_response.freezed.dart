// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_centers_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServiceCentersResponse {

 String? get message;@JsonKey(readValue: readList) List<ServiceCenterModel> get data;
/// Create a copy of ServiceCentersResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceCentersResponseCopyWith<ServiceCentersResponse> get copyWith => _$ServiceCentersResponseCopyWithImpl<ServiceCentersResponse>(this as ServiceCentersResponse, _$identity);

  /// Serializes this ServiceCentersResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceCentersResponse&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ServiceCentersResponse(message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $ServiceCentersResponseCopyWith<$Res>  {
  factory $ServiceCentersResponseCopyWith(ServiceCentersResponse value, $Res Function(ServiceCentersResponse) _then) = _$ServiceCentersResponseCopyWithImpl;
@useResult
$Res call({
 String? message,@JsonKey(readValue: readList) List<ServiceCenterModel> data
});




}
/// @nodoc
class _$ServiceCentersResponseCopyWithImpl<$Res>
    implements $ServiceCentersResponseCopyWith<$Res> {
  _$ServiceCentersResponseCopyWithImpl(this._self, this._then);

  final ServiceCentersResponse _self;
  final $Res Function(ServiceCentersResponse) _then;

/// Create a copy of ServiceCentersResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = freezed,Object? data = null,}) {
  return _then(_self.copyWith(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<ServiceCenterModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceCentersResponse].
extension ServiceCentersResponsePatterns on ServiceCentersResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceCentersResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceCentersResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceCentersResponse value)  $default,){
final _that = this;
switch (_that) {
case _ServiceCentersResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceCentersResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceCentersResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? message, @JsonKey(readValue: readList)  List<ServiceCenterModel> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceCentersResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? message, @JsonKey(readValue: readList)  List<ServiceCenterModel> data)  $default,) {final _that = this;
switch (_that) {
case _ServiceCentersResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? message, @JsonKey(readValue: readList)  List<ServiceCenterModel> data)?  $default,) {final _that = this;
switch (_that) {
case _ServiceCentersResponse() when $default != null:
return $default(_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceCentersResponse implements ServiceCentersResponse {
  const _ServiceCentersResponse({this.message, @JsonKey(readValue: readList) final  List<ServiceCenterModel> data = const <ServiceCenterModel>[]}): _data = data;
  factory _ServiceCentersResponse.fromJson(Map<String, dynamic> json) => _$ServiceCentersResponseFromJson(json);

@override final  String? message;
 final  List<ServiceCenterModel> _data;
@override@JsonKey(readValue: readList) List<ServiceCenterModel> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of ServiceCentersResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceCentersResponseCopyWith<_ServiceCentersResponse> get copyWith => __$ServiceCentersResponseCopyWithImpl<_ServiceCentersResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceCentersResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceCentersResponse&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'ServiceCentersResponse(message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ServiceCentersResponseCopyWith<$Res> implements $ServiceCentersResponseCopyWith<$Res> {
  factory _$ServiceCentersResponseCopyWith(_ServiceCentersResponse value, $Res Function(_ServiceCentersResponse) _then) = __$ServiceCentersResponseCopyWithImpl;
@override @useResult
$Res call({
 String? message,@JsonKey(readValue: readList) List<ServiceCenterModel> data
});




}
/// @nodoc
class __$ServiceCentersResponseCopyWithImpl<$Res>
    implements _$ServiceCentersResponseCopyWith<$Res> {
  __$ServiceCentersResponseCopyWithImpl(this._self, this._then);

  final _ServiceCentersResponse _self;
  final $Res Function(_ServiceCentersResponse) _then;

/// Create a copy of ServiceCentersResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? data = null,}) {
  return _then(_ServiceCentersResponse(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<ServiceCenterModel>,
  ));
}


}

// dart format on
