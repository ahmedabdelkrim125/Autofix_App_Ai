import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/networking/api_result.dart';
import '../../../core/networking/base_state.dart';
import '../data/models/user_model.dart';
import '../data/repos/profile_repo.dart';

class ProfileCubit extends Cubit<BaseState<UserModel>> {
  ProfileCubit(this._repo) : super(const BaseState.initial());

  final ProfileRepo _repo;

  Future<void> fetchProfile() async {
    emit(const BaseState.loading());
    final result = await _repo.getProfile();
    if (isClosed) return;
    switch (result) {
      case Success(:final data):
        final user = data.data;
        if (user == null) {
          emit(const BaseState.failure('Profile data not found'));
        } else {
          emit(BaseState.success(user));
        }
      case Failure(:final error):
        emit(BaseState.failure(error.displayMessage));
    }
  }
}
