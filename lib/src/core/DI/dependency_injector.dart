import 'package:get_it/get_it.dart';

import '../../app/features/auth/data/datasources/auth_remote_datasource.dart';
import '../../app/features/auth/data/repositories/auth_repository_impl.dart';
import '../../app/features/auth/domain/repositories/auth_repository_interface.dart';
import '../../app/features/auth/domain/usecases/login_usecase.dart';
import '../../app/features/auth/domain/usecases/sign_up_usecase.dart';
import '../../app/features/auth/presentation/bloc/auth_bloc.dart';
import '../../app/features/auth/presentation/controller/session_controller.dart';
import '../../app/features/home/data/datasources/pet_remote_datasource.dart';
import '../../app/features/home/data/repositories/pet_repository_impl.dart';
import '../../app/features/home/domain/repositories/pet_repository_interface.dart';
import '../../app/features/home/domain/usecases/get_pet_usecase.dart';
import '../../app/features/home/presentation/bloc/home_bloc.dart';
import '../cache/shared_preferences/shared_preferences_impl.dart';
import '../client_http/client_http.dart';
import '../client_http/dio/rest_client_dio_impl.dart';
import '../logger/logger_app_logger_impl.dart';
import '../services/session_service.dart';

final injector = GetIt.instance;

void setupDependencyInjector() {
  injector.registerFactory<IRestClient>(
    () => RestClientDioImpl(
      dio: DioFactory.dio(),
      logger: LoggerAppLoggerImpl(),
    ),
  );

  //SESSION Service
  injector.registerFactory<SessionService>(
    () => SessionService(
      sharedPreferences: SharedPreferencesImpl(),
    ),
  );

  // AUTH FEATURE
  injector.registerFactory<AuthRemoteDatasource>(
    () => AuthRemoteDatasource(
      restClientDioImpl: injector<IRestClient>(),
    ),
  );
  injector.registerFactory<IAuthRepository>(
    () => AuthRepositoryImpl(
      authRemoteDatasource: injector<AuthRemoteDatasource>(),
    ),
  );
  injector.registerFactory<PetRemoteDatasource>(
    () => PetRemoteDatasource(
      restClient: injector<RestClientDioImpl>(),
    ),
  );
  injector.registerFactory<IPetRepository>(
    () => PetRepositoryImpl(datasource: injector<PetRemoteDatasource>()),
  );
  injector.registerLazySingleton(
    () => AuthBloc(
      signUpUsecase: SignUpUsecase(
        authRepository: injector<IAuthRepository>(),
      ),
      loginUsecase: LoginUsecase(
        authRepository: injector<IAuthRepository>(),
        sessionService: injector<SessionService>(),
      ),
    ),
  );
  injector.registerLazySingleton(
    () => HomeBloc(
      getPetUsecase: GetPetUsecase(
        petRepository: injector<IPetRepository>(),
      ),
    ),
  );
}
