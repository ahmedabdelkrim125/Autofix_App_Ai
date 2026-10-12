import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/networking/api_result.dart';
import '../../../core/networking/base_state.dart';
import '../data/models/login_request_body.dart';
import '../data/models/login_response.dart';
import '../data/repos/auth_repo.dart';

class LoginCubit extends Cubit<BaseState<LoginResponse>> {
  LoginCubit(this._repo) : super(const BaseState.initial());

  final AuthRepo _repo;

  Future<void> login({required String email, required String password}) async {
    emit(const BaseState.loading());
    final result = await _repo.login(
      LoginRequestBody(email: email, password: password),
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
