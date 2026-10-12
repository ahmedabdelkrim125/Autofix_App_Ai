import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../models/service_centers_response.dart';
import '../models/tow_trucks_response.dart';

class ExpertsRepo {
  ExpertsRepo(this._api);

  final ApiService _api;

  Future<ApiResult<ServiceCentersResponse>> getServiceCenters() {
    return safeApiCall(() => _api.getServiceCenters());
  }

  Future<ApiResult<TowTrucksResponse>> getTowTrucks() {
    return safeApiCall(() => _api.getTowTrucks());
  }
}
