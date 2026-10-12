import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/networking/api_result.dart';
import '../../../core/networking/base_state.dart';
import '../../diagnose/data/models/fault_model.dart';
import '../../diagnose/data/repos/fault_repo.dart';

class HistoryCubit extends Cubit<BaseState<List<FaultModel>>> {
  HistoryCubit(this._repo) : super(const BaseState.initial());

  final FaultRepo _repo;

  Future<void> fetch() async {
    emit(const BaseState.loading());
    final result = await _repo.getHistory();
    if (isClosed) return;
    switch (result) {
      case Success(:final data):
        emit(BaseState.success(data.data));
      case Failure(:final error):
        emit(BaseState.failure(error.displayMessage));
    }
  }
}
