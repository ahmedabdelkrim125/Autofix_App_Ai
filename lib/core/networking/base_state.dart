import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_state.freezed.dart';

@freezed
sealed class BaseState<T> with _$BaseState<T> {
  const factory BaseState.initial() = BaseInitial<T>;
  const factory BaseState.loading() = BaseLoading<T>;
  const factory BaseState.success(T data) = BaseSuccess<T>;
  const factory BaseState.failure(String message) = BaseFailure<T>;
}
