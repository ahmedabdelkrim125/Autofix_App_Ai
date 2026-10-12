import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/networking/api_result.dart';
import '../../../core/networking/base_state.dart';
import '../data/models/tow_truck_model.dart';
import '../data/repos/experts_repo.dart';

class TowTrucksCubit extends Cubit<BaseState<List<TowTruckModel>>> {
  TowTrucksCubit(this._repo) : super(const BaseState.initial());

  final ExpertsRepo _repo;

  Future<void> fetch() async {
    emit(const BaseState.loading());
    final result = await _repo.getTowTrucks();
    if (isClosed) return;
    switch (result) {
      case Success(:final data):
        emit(BaseState.success(data.data));
      case Failure(:final error):
        emit(BaseState.failure(error.displayMessage));
    }
  }
}
