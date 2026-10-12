import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/auth/data/repos/auth_repo.dart';
import '../../features/auth/logic/forgot_password_cubit.dart';
import '../../features/auth/logic/login_cubit.dart';
import '../../features/auth/logic/reset_password_cubit.dart';
import '../../features/auth/logic/signup_cubit.dart';
import '../../features/diagnose/data/repos/fault_repo.dart';
import '../../features/diagnose/logic/diagnose_cubit.dart';
import '../../features/experts/data/repos/experts_repo.dart';
import '../../features/experts/logic/service_centers_cubit.dart';
import '../../features/experts/logic/tow_trucks_cubit.dart';
import '../../features/history/logic/history_cubit.dart';
import '../../features/home/logic/home_cubit.dart';
import '../../features/profile/data/repos/profile_repo.dart';
import '../../features/profile/logic/logout_cubit.dart';
import '../../features/profile/logic/profile_cubit.dart';
import '../helpers/token_storage.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupGetIt() async {
  final prefs = await SharedPreferences.getInstance();

  getIt.registerLazySingleton<TokenStorage>(() => TokenStorage(prefs));
  getIt.registerLazySingleton<Dio>(
    () => DioFactory.create(getIt<TokenStorage>()),
  );
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));

  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepo(getIt<ApiService>(), getIt<TokenStorage>()),
  );
  getIt.registerLazySingleton<ProfileRepo>(
    () => ProfileRepo(getIt<ApiService>(), getIt<TokenStorage>()),
  );

  getIt.registerLazySingleton<ExpertsRepo>(
    () => ExpertsRepo(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<FaultRepo>(() => FaultRepo(getIt<ApiService>()));

  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<AuthRepo>()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt<AuthRepo>()));
  getIt.registerFactory<ForgotPasswordCubit>(
    () => ForgotPasswordCubit(getIt<AuthRepo>()),
  );
  getIt.registerFactory<ResetPasswordCubit>(
    () => ResetPasswordCubit(getIt<AuthRepo>()),
  );
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt<ProfileRepo>()));
  getIt.registerFactory<LogoutCubit>(() => LogoutCubit(getIt<ProfileRepo>()));
  getIt.registerFactory<ServiceCentersCubit>(
    () => ServiceCentersCubit(getIt<ExpertsRepo>()),
  );
  getIt.registerFactory<TowTrucksCubit>(
    () => TowTrucksCubit(getIt<ExpertsRepo>()),
  );
  getIt.registerFactory<DiagnoseCubit>(() => DiagnoseCubit(getIt<FaultRepo>()));
  getIt.registerFactory<HistoryCubit>(() => HistoryCubit(getIt<FaultRepo>()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<FaultRepo>()));
}
