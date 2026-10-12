import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/networking/api_result.dart';
import '../../../core/networking/base_state.dart';
import '../data/models/diagnose_response.dart';
import '../data/models/fault_model.dart';
import '../data/repos/fault_repo.dart';

class DiagnoseCubit extends Cubit<BaseState<FaultModel>> {
  DiagnoseCubit(this._repo) : super(const BaseState.initial());

  final FaultRepo _repo;

  Future<void> diagnoseText(String text) async {
    emit(const BaseState.loading());
    _handle(await _repo.diagnoseText(text));
  }

  Future<void> diagnoseImage(File image) async {
    emit(const BaseState.loading());
    _handle(await _repo.diagnoseImage(image));
  }

  void _handle(ApiResult<DiagnoseResponse> result) {
    if (isClosed) return;
    switch (result) {
      case Success(:final data):
        final fault = data.data;
        if (fault == null) {
          emit(const BaseState.failure('No diagnosis was returned'));
        } else {
          emit(BaseState.success(fault));
        }
      case Failure(:final error):
        emit(BaseState.failure(error.displayMessage));
    }
  }
}
