// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_center_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServiceCenterModel {

@JsonKey(readValue: readId) String? get id; String? get name; String? get phone;@JsonKey(readValue: _readAddress) String? get address;@JsonKey(readValue: _readCity) String? get city; List<String>? get specialties; String? get workingHours; double? get rating; int? get ratingsCount; double? get distanceKm;
/// Create a copy of ServiceCenterModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceCenterModelCopyWith<ServiceCenterModel> get copyWith => _$ServiceCenterModelCopyWithImpl<ServiceCenterModel>(this as ServiceCenterModel, _$identity);

  /// Serializes this ServiceCenterModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceCenterModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city)&&const DeepCollectionEquality().equals(other.specialties, specialties)&&(identical(other.workingHours, workingHours) || other.workingHours == workingHours)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.ratingsCount, ratingsCount) || other.ratingsCount == ratingsCount)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,phone,address,city,const DeepCollectionEquality().hash(specialties),workingHours,rating,ratingsCount,distanceKm);

@override
String toString() {
  return 'ServiceCenterModel(id: $id, name: $name, phone: $phone, address: $address, city: $city, specialties: $specialties, workingHours: $workingHours, rating: $rating, ratingsCount: $ratingsCount, distanceKm: $distanceKm)';
}


}

/// @nodoc
abstract mixin class $ServiceCenterModelCopyWith<$Res>  {
  factory $ServiceCenterModelCopyWith(ServiceCenterModel value, $Res Function(ServiceCenterModel) _then) = _$ServiceCenterModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(readValue: readId) String? id, String? name, String? phone,@JsonKey(readValue: _readAddress) String? address,@JsonKey(readValue: _readCity) String? city, List<String>? specialties, String? workingHours, double? rating, int? ratingsCount, double? distanceKm
});




}
/// @nodoc
class _$ServiceCenterModelCopyWithImpl<$Res>
    implements $ServiceCenterModelCopyWith<$Res> {
  _$ServiceCenterModelCopyWithImpl(this._self, this._then);

  final ServiceCenterModel _self;
  final $Res Function(ServiceCenterModel) _then;

/// Create a copy of ServiceCenterModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? phone = freezed,Object? address = freezed,Object? city = freezed,Object? specialties = freezed,Object? workingHours = freezed,Object? rating = freezed,Object? ratingsCount = freezed,Object? distanceKm = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,specialties: freezed == specialties ? _self.specialties : specialties // ignore: cast_nullable_to_non_nullable
as List<String>?,workingHours: freezed == workingHours ? _self.workingHours : workingHours // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,ratingsCount: freezed == ratingsCount ? _self.ratingsCount : ratingsCount // ignore: cast_nullable_to_non_nullable
as int?,distanceKm: freezed == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceCenterModel].
extension ServiceCenterModelPatterns on ServiceCenterModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceCenterModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceCenterModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceCenterModel value)  $default,){
final _that = this;
switch (_that) {
case _ServiceCenterModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceCenterModel value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceCenterModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(readValue: readId)  String? id,  String? name,  String? phone, @JsonKey(readValue: _readAddress)  String? address, @JsonKey(readValue: _readCity)  String? city,  List<String>? specialties,  String? workingHours,  double? rating,  int? ratingsCount,  double? distanceKm)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceCenterModel() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.address,_that.city,_that.specialties,_that.workingHours,_that.rating,_that.ratingsCount,_that.distanceKm);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(readValue: readId)  String? id,  String? name,  String? phone, @JsonKey(readValue: _readAddress)  String? address, @JsonKey(readValue: _readCity)  String? city,  List<String>? specialties,  String? workingHours,  double? rating,  int? ratingsCount,  double? distanceKm)  $default,) {final _that = this;
switch (_that) {
case _ServiceCenterModel():
return $default(_that.id,_that.name,_that.phone,_that.address,_that.city,_that.specialties,_that.workingHours,_that.rating,_that.ratingsCount,_that.distanceKm);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(readValue: readId)  String? id,  String? name,  String? phone, @JsonKey(readValue: _readAddress)  String? address, @JsonKey(readValue: _readCity)  String? city,  List<String>? specialties,  String? workingHours,  double? rating,  int? ratingsCount,  double? distanceKm)?  $default,) {final _that = this;
switch (_that) {
case _ServiceCenterModel() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.address,_that.city,_that.specialties,_that.workingHours,_that.rating,_that.ratingsCount,_that.distanceKm);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceCenterModel implements ServiceCenterModel {
  const _ServiceCenterModel({@JsonKey(readValue: readId) this.id, this.name, this.phone, @JsonKey(readValue: _readAddress) this.address, @JsonKey(readValue: _readCity) this.city, final  List<String>? specialties, this.workingHours, this.rating, this.ratingsCount, this.distanceKm}): _specialties = specialties;
  factory _ServiceCenterModel.fromJson(Map<String, dynamic> json) => _$ServiceCenterModelFromJson(json);

@override@JsonKey(readValue: readId) final  String? id;
@override final  String? name;
@override final  String? phone;
@override@JsonKey(readValue: _readAddress) final  String? address;
@override@JsonKey(readValue: _readCity) final  String? city;
 final  List<String>? _specialties;
@override List<String>? get specialties {
  final value = _specialties;
  if (value == null) return null;
  if (_specialties is EqualUnmodifiableListView) return _specialties;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? workingHours;
@override final  double? rating;
@override final  int? ratingsCount;
@override final  double? distanceKm;

/// Create a copy of ServiceCenterModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceCenterModelCopyWith<_ServiceCenterModel> get copyWith => __$ServiceCenterModelCopyWithImpl<_ServiceCenterModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceCenterModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceCenterModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city)&&const DeepCollectionEquality().equals(other._specialties, _specialties)&&(identical(other.workingHours, workingHours) || other.workingHours == workingHours)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.ratingsCount, ratingsCount) || other.ratingsCount == ratingsCount)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,phone,address,city,const DeepCollectionEquality().hash(_specialties),workingHours,rating,ratingsCount,distanceKm);

@override
String toString() {
  return 'ServiceCenterModel(id: $id, name: $name, phone: $phone, address: $address, city: $city, specialties: $specialties, workingHours: $workingHours, rating: $rating, ratingsCount: $ratingsCount, distanceKm: $distanceKm)';
}


}

/// @nodoc
abstract mixin class _$ServiceCenterModelCopyWith<$Res> implements $ServiceCenterModelCopyWith<$Res> {
  factory _$ServiceCenterModelCopyWith(_ServiceCenterModel value, $Res Function(_ServiceCenterModel) _then) = __$ServiceCenterModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(readValue: readId) String? id, String? name, String? phone,@JsonKey(readValue: _readAddress) String? address,@JsonKey(readValue: _readCity) String? city, List<String>? specialties, String? workingHours, double? rating, int? ratingsCount, double? distanceKm
});




}
/// @nodoc
class __$ServiceCenterModelCopyWithImpl<$Res>
    implements _$ServiceCenterModelCopyWith<$Res> {
  __$ServiceCenterModelCopyWithImpl(this._self, this._then);

  final _ServiceCenterModel _self;
  final $Res Function(_ServiceCenterModel) _then;

/// Create a copy of ServiceCenterModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? phone = freezed,Object? address = freezed,Object? city = freezed,Object? specialties = freezed,Object? workingHours = freezed,Object? rating = freezed,Object? ratingsCount = freezed,Object? distanceKm = freezed,}) {
  return _then(_ServiceCenterModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,specialties: freezed == specialties ? _self._specialties : specialties // ignore: cast_nullable_to_non_nullable
as List<String>?,workingHours: freezed == workingHours ? _self.workingHours : workingHours // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,ratingsCount: freezed == ratingsCount ? _self.ratingsCount : ratingsCount // ignore: cast_nullable_to_non_nullable
as int?,distanceKm: freezed == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
