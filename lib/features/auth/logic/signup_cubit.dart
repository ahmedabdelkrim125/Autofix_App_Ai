import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/app_location.dart';
import '../../../core/networking/api_result.dart';
import '../../../core/networking/base_state.dart';
import '../../../core/networking/models/location_model.dart';
import '../../../core/networking/models/message_response.dart';
import '../data/models/signup_request_body.dart';
import '../data/repos/auth_repo.dart';

class SignupCubit extends Cubit<BaseState<MessageResponse>> {
  SignupCubit(this._repo) : super(const BaseState.initial());

  final AuthRepo _repo;

  Future<void> signup({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    emit(const BaseState.loading());
    final result = await _repo.signup(
      SignupRequestBody(
        name: name,
        email: email,
        phone: phone,
        password: password,
        confirmPassword: confirmPassword,
        location: const LocationModel(
          coordinates: [AppLocation.longitude, AppLocation.latitude],
        ),
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
