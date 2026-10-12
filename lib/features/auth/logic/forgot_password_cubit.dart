import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/networking/api_result.dart';
import '../../../core/networking/base_state.dart';
import '../../../core/networking/models/message_response.dart';
import '../data/models/forgot_password_request_body.dart';
import '../data/repos/auth_repo.dart';

class ForgotPasswordCubit extends Cubit<BaseState<MessageResponse>> {
  ForgotPasswordCubit(this._repo) : super(const BaseState.initial());

  final AuthRepo _repo;

  Future<void> sendCode(String email) async {
    emit(const BaseState.loading());
    final result = await _repo.forgotPassword(
      ForgotPasswordRequestBody(email: email),
    );
    if (isClosed) return;
    switch (result) {
      case Success(:final data):
        emit(BaseState.success(data));
      case Failure(:final error):
        emit(BaseState.failure(error.displayMessage));
    }
  }
}
