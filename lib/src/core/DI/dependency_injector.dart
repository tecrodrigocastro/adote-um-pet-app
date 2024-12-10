import 'package:get_it/get_it.dart';

import '../../app/features/auth/data/datasources/auth_remote_datasource.dart';
import '../../app/features/auth/data/repositories/auth_repository_impl.dart';
import '../../app/features/auth/domain/repositories/auth_repository_interface.dart';
import '../../app/features/auth/domain/usecases/login_usecase.dart';
import '../../app/features/auth/domain/usecases/sign_up_usecase.dart';
import '../../app/features/auth/infrastructure/interceptor/auth_interceptor.dart';
import '../../app/features/auth/presentation/viewmodels/auth_viewmodel.dart';
import '../../app/features/home/data/datasources/pet_remote_datasource.dart';
import '../../app/features/home/data/repositories/pet_repository_impl.dart';
import '../../app/features/home/domain/repositories/pet_repository_interface.dart';
import '../../app/features/home/domain/usecases/get_pet_usecase.dart';
import '../../app/features/home/presentation/viewmodels/home_viewmodel.dart';
import '../cache/shared_preferences/shared_preferences_impl.dart';
import '../client_http/client_http.dart';
import '../client_http/dio/rest_client_dio_impl.dart';
import '../client_http/logger/client_interceptor_logger_impl.dart';
import '../logger/logger_app_logger_impl.dart';
import '../services/session_service.dart';

final injector = GetIt.instance;

void setupDependencyInjector({bool loggerAPI = false}) {
  injector.registerFactory<IRestClient>(() {
    final instance = RestClientDioImpl(
      dio: DioFactory.dio(),
      logger: LoggerAppLoggerImpl(),
    );

    instance.addInterceptors(
      AuthInterceptor(sessionService: injector<SessionService>()),
    );

    if (loggerAPI) {
      instance.addInterceptors(ClientInterceptorLoggerImpl());
    }

    return instance;
  });

  //SESSION Service
  injector.registerFactory<SessionService>(
    () => SessionService(
      sharedPreferences: SharedPreferencesImpl(),
    ),
  );

  // AUTH FEATURE
  injector.registerFactory<AuthRemoteDatasource>(
    () => AuthRemoteDatasource(
      restClient: injector<IRestClient>(),
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
    () => AuthViewmodel(
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
    () => HomeViewmodel(
      getPetUsecase: GetPetUsecase(
        petRepository: injector<IPetRepository>(),
      ),
    ),
  );
}
