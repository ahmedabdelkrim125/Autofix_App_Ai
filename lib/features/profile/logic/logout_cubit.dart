import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/networking/api_result.dart';
import '../../../core/networking/base_state.dart';
import '../../../core/networking/models/message_response.dart';
import '../data/repos/profile_repo.dart';

class LogoutCubit extends Cubit<BaseState<MessageResponse>> {
  LogoutCubit(this._repo) : super(const BaseState.initial());

  final ProfileRepo _repo;

  Future<void> logout() async {
    emit(const BaseState.loading());
    final result = await _repo.logout();
    if (isClosed) return;
    switch (result) {
      case Success(:final data):
        emit(BaseState.success(data));
      case Failure(:final error):
        emit(BaseState.failure(error.displayMessage));
    }
  }
}
