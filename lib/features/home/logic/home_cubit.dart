import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/networking/api_result.dart';
import '../../../core/networking/base_state.dart';
import '../../diagnose/data/models/fault_model.dart';
import '../../diagnose/data/repos/fault_repo.dart';

class HomeData {
  const HomeData({required this.recentDiagnoses});

  final List<FaultModel> recentDiagnoses;

  int get resolvedCount => recentDiagnoses.where(_isResolved).length;

  int get activeCount => recentDiagnoses.where(_isActive).length;

  List<FaultModel> get latest => recentDiagnoses.take(3).toList();

  static bool _isResolved(FaultModel fault) {
    final status = (fault.status ?? '').toLowerCase();
    return status.contains('resolv') ||
        status.contains('complet') ||
        status.contains('done') ||
        status.contains('closed');
  }

  static bool _isActive(FaultModel fault) {
    final status = (fault.status ?? '').toLowerCase();
    return status.contains('progress') ||
        status.contains('pending') ||
        status.contains('open');
  }
}

class HomeCubit extends Cubit<BaseState<HomeData>> {
  HomeCubit(this._repo) : super(const BaseState.initial());

  final FaultRepo _repo;

  Future<void> fetch() async {
    emit(const BaseState.loading());
    final result = await _repo.getHistory(limit: 10);
    if (isClosed) return;
    switch (result) {
      case Success(:final data):
        final items = [...data.data]
          ..sort((a, b) {
            final aDate = a.date ?? DateTime.fromMillisecondsSinceEpoch(0);
            final bDate = b.date ?? DateTime.fromMillisecondsSinceEpoch(0);
            return bDate.compareTo(aDate);
          });
        emit(BaseState.success(HomeData(recentDiagnoses: items)));
      case Failure(:final error):
        emit(BaseState.failure(error.displayMessage));
    }
  }
}
