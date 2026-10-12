import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/networking/api_result.dart';
import '../../../core/networking/base_state.dart';
import '../../../core/networking/models/message_response.dart';
import '../data/models/reset_password_request_body.dart';
import '../data/repos/auth_repo.dart';

class ResetPasswordCubit extends Cubit<BaseState<MessageResponse>> {
  ResetPasswordCubit(this._repo) : super(const BaseState.initial());

  final AuthRepo _repo;

  Future<void> resetPassword({
    required String email,
    required String otp,
    required String password,
    required String confirmPassword,
  }) async {
    emit(const BaseState.loading());
    final result = await _repo.resetPassword(
      ResetPasswordRequestBody(
        email: email,
        otp: otp,
        password: password,
        confirmPassword: confirmPassword,
      ),
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
