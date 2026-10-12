// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fault_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FaultModel {

@JsonKey(readValue: readId) String? get id; String? get faultType; String? get faultText; String? get difficulty; String? get status; String? get createdAt;@JsonKey(readValue: readSelf) Map<String, dynamic>? get raw;
/// Create a copy of FaultModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaultModelCopyWith<FaultModel> get copyWith => _$FaultModelCopyWithImpl<FaultModel>(this as FaultModel, _$identity);

  /// Serializes this FaultModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaultModel&&(identical(other.id, id) || other.id == id)&&(identical(other.faultType, faultType) || other.faultType == faultType)&&(identical(other.faultText, faultText) || other.faultText == faultText)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.raw, raw));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,faultType,faultText,difficulty,status,createdAt,const DeepCollectionEquality().hash(raw));

@override
String toString() {
  return 'FaultModel(id: $id, faultType: $faultType, faultText: $faultText, difficulty: $difficulty, status: $status, createdAt: $createdAt, raw: $raw)';
}


}

/// @nodoc
abstract mixin class $FaultModelCopyWith<$Res>  {
  factory $FaultModelCopyWith(FaultModel value, $Res Function(FaultModel) _then) = _$FaultModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(readValue: readId) String? id, String? faultType, String? faultText, String? difficulty, String? status, String? createdAt,@JsonKey(readValue: readSelf) Map<String, dynamic>? raw
});




}
/// @nodoc
class _$FaultModelCopyWithImpl<$Res>
    implements $FaultModelCopyWith<$Res> {
  _$FaultModelCopyWithImpl(this._self, this._then);

  final FaultModel _self;
  final $Res Function(FaultModel) _then;

/// Create a copy of FaultModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? faultType = freezed,Object? faultText = freezed,Object? difficulty = freezed,Object? status = freezed,Object? createdAt = freezed,Object? raw = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,faultType: freezed == faultType ? _self.faultType : faultType // ignore: cast_nullable_to_non_nullable
as String?,faultText: freezed == faultText ? _self.faultText : faultText // ignore: cast_nullable_to_non_nullable
as String?,difficulty: freezed == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,raw: freezed == raw ? _self.raw : raw // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [FaultModel].
extension FaultModelPatterns on FaultModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FaultModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FaultModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FaultModel value)  $default,){
final _that = this;
switch (_that) {
case _FaultModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FaultModel value)?  $default,){
final _that = this;
switch (_that) {
case _FaultModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(readValue: readId)  String? id,  String? faultType,  String? faultText,  String? difficulty,  String? status,  String? createdAt, @JsonKey(readValue: readSelf)  Map<String, dynamic>? raw)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FaultModel() when $default != null:
return $default(_that.id,_that.faultType,_that.faultText,_that.difficulty,_that.status,_that.createdAt,_that.raw);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(readValue: readId)  String? id,  String? faultType,  String? faultText,  String? difficulty,  String? status,  String? createdAt, @JsonKey(readValue: readSelf)  Map<String, dynamic>? raw)  $default,) {final _that = this;
switch (_that) {
case _FaultModel():
return $default(_that.id,_that.faultType,_that.faultText,_that.difficulty,_that.status,_that.createdAt,_that.raw);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(readValue: readId)  String? id,  String? faultType,  String? faultText,  String? difficulty,  String? status,  String? createdAt, @JsonKey(readValue: readSelf)  Map<String, dynamic>? raw)?  $default,) {final _that = this;
switch (_that) {
case _FaultModel() when $default != null:
return $default(_that.id,_that.faultType,_that.faultText,_that.difficulty,_that.status,_that.createdAt,_that.raw);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FaultModel extends FaultModel {
  const _FaultModel({@JsonKey(readValue: readId) this.id, this.faultType, this.faultText, this.difficulty, this.status, this.createdAt, @JsonKey(readValue: readSelf) final  Map<String, dynamic>? raw}): _raw = raw,super._();
  factory _FaultModel.fromJson(Map<String, dynamic> json) => _$FaultModelFromJson(json);

@override@JsonKey(readValue: readId) final  String? id;
@override final  String? faultType;
@override final  String? faultText;
@override final  String? difficulty;
@override final  String? status;
@override final  String? createdAt;
 final  Map<String, dynamic>? _raw;
@override@JsonKey(readValue: readSelf) Map<String, dynamic>? get raw {
  final value = _raw;
  if (value == null) return null;
  if (_raw is EqualUnmodifiableMapView) return _raw;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of FaultModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FaultModelCopyWith<_FaultModel> get copyWith => __$FaultModelCopyWithImpl<_FaultModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FaultModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FaultModel&&(identical(other.id, id) || other.id == id)&&(identical(other.faultType, faultType) || other.faultType == faultType)&&(identical(other.faultText, faultText) || other.faultText == faultText)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._raw, _raw));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,faultType,faultText,difficulty,status,createdAt,const DeepCollectionEquality().hash(_raw));

@override
String toString() {
  return 'FaultModel(id: $id, faultType: $faultType, faultText: $faultText, difficulty: $difficulty, status: $status, createdAt: $createdAt, raw: $raw)';
}


}

/// @nodoc
abstract mixin class _$FaultModelCopyWith<$Res> implements $FaultModelCopyWith<$Res> {
  factory _$FaultModelCopyWith(_FaultModel value, $Res Function(_FaultModel) _then) = __$FaultModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(readValue: readId) String? id, String? faultType, String? faultText, String? difficulty, String? status, String? createdAt,@JsonKey(readValue: readSelf) Map<String, dynamic>? raw
});




}
/// @nodoc
class __$FaultModelCopyWithImpl<$Res>
    implements _$FaultModelCopyWith<$Res> {
  __$FaultModelCopyWithImpl(this._self, this._then);

  final _FaultModel _self;
  final $Res Function(_FaultModel) _then;

/// Create a copy of FaultModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? faultType = freezed,Object? faultText = freezed,Object? difficulty = freezed,Object? status = freezed,Object? createdAt = freezed,Object? raw = freezed,}) {
  return _then(_FaultModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,faultType: freezed == faultType ? _self.faultType : faultType // ignore: cast_nullable_to_non_nullable
as String?,faultText: freezed == faultText ? _self.faultText : faultText // ignore: cast_nullable_to_non_nullable
as String?,difficulty: freezed == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,raw: freezed == raw ? _self._raw : raw // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
