import 'dart:developer';

import 'package:result_dart/result_dart.dart';

import '../../../../../core/client_http/app_response.dart';
import '../../../../../core/errors/errors.dart';
import '../../../../../core/errors/unauthorized_exception.dart';
import '../../../../../core/typedefs/types.dart';
import '../../domain/dtos/login_params.dart';
import '../../domain/dtos/register_params.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository_interface.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/reponse/auth_model.dart';
import '../models/reponse/user_model.dart';
import '../models/request/login_model.dart';
import '../models/request/register_model.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final AuthRemoteDatasource _authRemoteDatasource;

  AuthRepositoryImpl({
    required AuthRemoteDatasource authRemoteDatasource,
  }) : _authRemoteDatasource = authRemoteDatasource;

  @override
  Output<AppResponse<AuthEntity>> login(
    LoginParams params,
  ) async {
    try {
      final response = await _authRemoteDatasource.login(
        LoginModel(email: params.email, password: params.password),
      );

      log('Response: ${response.data}');

      if (response.statusCode == 200) {
        final appResponse = AppResponse<AuthEntity>.fromJson(
          response.data,
          (dynamic json) => AuthModel.fromMap(json as Map<String, dynamic>),
        );

        return Success(appResponse);
      }

      if (response.statusCode == 401) {
        return Failure(
          UnauthorizedException(
            message: response.data['message'],
          ),
        );
      }

      return Failure(
        ServerException(
          message: 'Error',
          error: response.data['message'],
        ),
      );
    } catch (e) {
      return Failure(
        ServerException(
          message: 'Error',
          error: e.toString(),
        ),
      );
    }
  }

  @override
  Output<AppResponse<UserEntity>> signUp(RegisterParams params) async {
    try {
      final response = await _authRemoteDatasource.register(RegisterModel(
        photoUrl: 'url',
        email: params.email,
        phone: params.phone,
        name: params.name,
        address: params.address,
        complement: params.complement,
        numberHouse: params.numberHouse,
        zipCode: params.zipCode,
        password: params.password,
      ));

      if (response.statusCode == 201) {
        final appResponse = AppResponse<UserEntity>.fromJson(
          response.data,
          (dynamic json) => UserModel.fromMap(json as Map<String, dynamic>),
        );

        return Success(appResponse);
      }

      return Failure(
        ServerException(
          message: 'Error',
          error: response.data['message'],
        ),
      );
    } catch (e) {
      return Failure(
        ServerException(
          message: 'Error',
          error: e.toString(),
        ),
      );
    }
  }
}
