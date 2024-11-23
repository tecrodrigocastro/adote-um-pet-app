import '../../../../../core/client_http/app_response.dart';
import '../../../../../core/typedefs/types.dart';
import '../../../../../core/usecase/usecase_interface.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository_interface.dart';

class SignUpUsecase implements UseCase<AppResponse<UserEntity>, SignUpParams> {
  final IAuthRepository _authRepository;

  SignUpUsecase({
    required IAuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<Output<AppResponse<UserEntity>>> call(SignUpParams params) async {
    return await _authRepository.signUp(
      name: params.name,
      email: params.email,
      password: params.password,
      phone: params.phone,
      zipCode: params.zipCode,
      address: params.address,
      numberHouse: params.numberHouse,
      complement: params.complement,
    );
  }
}

class SignUpParams {
  final String name;
  final String email;
  final String password;
  final String phone;
  final String zipCode;
  final String address;
  final int numberHouse;
  final String complement;

  SignUpParams({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.zipCode,
    required this.address,
    required this.numberHouse,
    required this.complement,
  });
}
