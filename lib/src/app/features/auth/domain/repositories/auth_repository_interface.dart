import '../../../../../core/client_http/app_response.dart';
import '../../../../../core/typedefs/types.dart';
import '../dtos/login_params.dart';
import '../dtos/register_params.dart';
import '../entities/auth_entity.dart';
import '../entities/user_entity.dart';

abstract interface class IAuthRepository {
  Output<AppResponse<AuthEntity>> login(LoginParams params);
  Output<AppResponse<UserEntity>> signUp(RegisterParams params);
}
