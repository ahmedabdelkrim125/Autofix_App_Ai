import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/networking/api_result.dart';
import '../../../core/networking/base_state.dart';
import '../data/models/service_center_model.dart';
import '../data/repos/experts_repo.dart';

class ServiceCentersCubit extends Cubit<BaseState<List<ServiceCenterModel>>> {
  ServiceCentersCubit(this._repo) : super(const BaseState.initial());

  final ExpertsRepo _repo;

  Future<void> fetch() async {
    emit(const BaseState.loading());
    final result = await _repo.getServiceCenters();
    if (isClosed) return;
    switch (result) {
      case Success(:final data):
        emit(BaseState.success(data.data));
      case Failure(:final error):
        emit(BaseState.failure(error.displayMessage));
    }
  }
}
