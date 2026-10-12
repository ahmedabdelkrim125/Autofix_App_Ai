import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../features/auth/data/models/forgot_password_request_body.dart';
import '../../features/diagnose/data/models/diagnose_response.dart';
import '../../features/experts/data/models/service_centers_response.dart';
import '../../features/experts/data/models/tow_trucks_response.dart';
import '../../features/history/data/models/fault_history_response.dart';
import '../../features/auth/data/models/login_request_body.dart';
import '../../features/auth/data/models/login_response.dart';
import '../../features/auth/data/models/refresh_token_request_body.dart';
import '../../features/auth/data/models/reset_password_request_body.dart';
import '../../features/auth/data/models/signup_request_body.dart';
import '../../features/profile/data/models/logout_request_body.dart';
import '../../features/profile/data/models/profile_response.dart';
import 'api_constants.dart';
import 'models/message_response.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody body);

  @POST(ApiConstants.signup)
  Future<MessageResponse> signup(@Body() SignupRequestBody body);

  @PATCH(ApiConstants.forgotPassword)
  Future<MessageResponse> forgotPassword(
    @Body() ForgotPasswordRequestBody body,
  );

  @PATCH(ApiConstants.resetPassword)
  Future<MessageResponse> resetPassword(@Body() ResetPasswordRequestBody body);

  @POST(ApiConstants.refreshToken)
  Future<LoginResponse> refreshToken(@Body() RefreshTokenRequestBody body);

  @GET(ApiConstants.profile)
  Future<ProfileResponse> getProfile();

  @POST(ApiConstants.logout)
  Future<MessageResponse> logout(@Body() LogoutRequestBody body);

  @GET(ApiConstants.serviceCenters)
  Future<ServiceCentersResponse> getServiceCenters();

  @GET(ApiConstants.towTrucks)
  Future<TowTrucksResponse> getTowTrucks();

  @POST(ApiConstants.diagnoseFault)
  @MultiPart()
  Future<DiagnoseResponse> diagnoseText(
    @Part(name: 'faultType') String faultType,
    @Part(name: 'faultText') String faultText,
    @Part(name: 'lng') String lng,
    @Part(name: 'lat') String lat,
  );

  @POST(ApiConstants.diagnoseFault)
  @MultiPart()
  Future<DiagnoseResponse> diagnoseImage(
    @Part(name: 'faultType') String faultType,
    @Part(name: 'lng') String lng,
    @Part(name: 'lat') String lat,
    @Part(name: 'image') MultipartFile image,
  );

  @GET(ApiConstants.faultHistory)
  Future<FaultHistoryResponse> getFaultHistory(
    @Query('page') int page,
    @Query('limit') int limit,
  );
}
