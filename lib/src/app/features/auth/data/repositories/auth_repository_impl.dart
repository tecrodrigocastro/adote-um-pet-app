import 'dart:developer';

import 'package:fpdart/fpdart.dart';

import '../../../../../core/client_http/app_response.dart';
import '../../../../../core/client_http/client_http.dart';
import '../../../../../core/errors/errors.dart';
import '../../../../../core/errors/unauthorized_exception.dart';
import '../../../../../core/typedefs/types.dart';
import '../../../../../core/utils/end_points.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository_interface.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/auth_model.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final AuthRemoteDatasource _authRemoteDatasource;

  AuthRepositoryImpl({
    required AuthRemoteDatasource authRemoteDatasource,
  }) : _authRemoteDatasource = authRemoteDatasource;

  @override
  Future<Output<AppResponse<AuthEntity>>> login(
    String email,
    String password,
  ) async {
    try {
      final response = await _authRemoteDatasource.post(
        RestClientRequest(
          path: EndPoints.login,
          data: {
            'email': email,
            'password': password,
          },
        ),
      );

      log('Response: ${response.data}');

      if (response.statusCode == 200) {
        final appResponse = AppResponse<AuthEntity>.fromJson(
          response.data,
          (dynamic json) => AuthModel.fromMap(json as Map<String, dynamic>),
        );

        return right(appResponse);
      }

      if (response.statusCode == 401) {
        return left(
          UnauthorizedException(
            message: response.data['message'],
          ),
        );
      }

      return left(
        ServerException(
          message: 'Error',
          error: response.data['message'],
        ),
      );
    } catch (e) {
      return left(
        ServerException(
          message: 'Error',
          error: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Output<AppResponse<UserEntity>>> signUp({required UserEntity user}) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
