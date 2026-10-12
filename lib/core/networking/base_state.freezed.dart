// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BaseState<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BaseState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BaseState<$T>()';
}


}

/// @nodoc
class $BaseStateCopyWith<T,$Res>  {
$BaseStateCopyWith(BaseState<T> _, $Res Function(BaseState<T>) __);
}


/// Adds pattern-matching-related methods to [BaseState].
extension BaseStatePatterns<T> on BaseState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( BaseInitial<T> value)?  initial,TResult Function( BaseLoading<T> value)?  loading,TResult Function( BaseSuccess<T> value)?  success,TResult Function( BaseFailure<T> value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case BaseInitial() when initial != null:
return initial(_that);case BaseLoading() when loading != null:
return loading(_that);case BaseSuccess() when success != null:
return success(_that);case BaseFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( BaseInitial<T> value)  initial,required TResult Function( BaseLoading<T> value)  loading,required TResult Function( BaseSuccess<T> value)  success,required TResult Function( BaseFailure<T> value)  failure,}){
final _that = this;
switch (_that) {
case BaseInitial():
return initial(_that);case BaseLoading():
return loading(_that);case BaseSuccess():
return success(_that);case BaseFailure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( BaseInitial<T> value)?  initial,TResult? Function( BaseLoading<T> value)?  loading,TResult? Function( BaseSuccess<T> value)?  success,TResult? Function( BaseFailure<T> value)?  failure,}){
final _that = this;
switch (_that) {
case BaseInitial() when initial != null:
return initial(_that);case BaseLoading() when loading != null:
return loading(_that);case BaseSuccess() when success != null:
return success(_that);case BaseFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( T data)?  success,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case BaseInitial() when initial != null:
return initial();case BaseLoading() when loading != null:
return loading();case BaseSuccess() when success != null:
return success(_that.data);case BaseFailure() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( T data)  success,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case BaseInitial():
return initial();case BaseLoading():
return loading();case BaseSuccess():
return success(_that.data);case BaseFailure():
return failure(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( T data)?  success,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case BaseInitial() when initial != null:
return initial();case BaseLoading() when loading != null:
return loading();case BaseSuccess() when success != null:
return success(_that.data);case BaseFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class BaseInitial<T> implements BaseState<T> {
  const BaseInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BaseInitial<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BaseState<$T>.initial()';
}


}




/// @nodoc


class BaseLoading<T> implements BaseState<T> {
  const BaseLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BaseLoading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BaseState<$T>.loading()';
}


}




/// @nodoc


class BaseSuccess<T> implements BaseState<T> {
  const BaseSuccess(this.data);
  

 final  T data;

/// Create a copy of BaseState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BaseSuccessCopyWith<T, BaseSuccess<T>> get copyWith => _$BaseSuccessCopyWithImpl<T, BaseSuccess<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BaseSuccess<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'BaseState<$T>.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $BaseSuccessCopyWith<T,$Res> implements $BaseStateCopyWith<T, $Res> {
  factory $BaseSuccessCopyWith(BaseSuccess<T> value, $Res Function(BaseSuccess<T>) _then) = _$BaseSuccessCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class _$BaseSuccessCopyWithImpl<T,$Res>
    implements $BaseSuccessCopyWith<T, $Res> {
  _$BaseSuccessCopyWithImpl(this._self, this._then);

  final BaseSuccess<T> _self;
  final $Res Function(BaseSuccess<T>) _then;

/// Create a copy of BaseState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(BaseSuccess<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class BaseFailure<T> implements BaseState<T> {
  const BaseFailure(this.message);
  

 final  String message;

/// Create a copy of BaseState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BaseFailureCopyWith<T, BaseFailure<T>> get copyWith => _$BaseFailureCopyWithImpl<T, BaseFailure<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BaseFailure<T>&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'BaseState<$T>.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $BaseFailureCopyWith<T,$Res> implements $BaseStateCopyWith<T, $Res> {
  factory $BaseFailureCopyWith(BaseFailure<T> value, $Res Function(BaseFailure<T>) _then) = _$BaseFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$BaseFailureCopyWithImpl<T,$Res>
    implements $BaseFailureCopyWith<T, $Res> {
  _$BaseFailureCopyWithImpl(this._self, this._then);

  final BaseFailure<T> _self;
  final $Res Function(BaseFailure<T>) _then;

/// Create a copy of BaseState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(BaseFailure<T>(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
