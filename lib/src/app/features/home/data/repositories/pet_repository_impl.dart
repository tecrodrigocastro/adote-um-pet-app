import 'package:result_dart/result_dart.dart';

import '../../../../../core/client_http/app_response.dart';
import '../../../../../core/errors/errors.dart';
import '../../../../../core/errors/unauthorized_exception.dart';
import '../../../../../core/typedefs/types.dart';
import '../../domain/entities/pet_entity.dart';
import '../../domain/repositories/pet_repository_interface.dart';
import '../datasources/pet_remote_datasource.dart';
import '../models/pet_model.dart';

class PetRepositoryImpl implements IPetRepository {
  final PetRemoteDatasource datasource;

  const PetRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Output<AppResponse<List<PetEntity>>>> getPets({
    String? type,
    String? gender,
    String? size,
  }) async {
    try {
      final result = await datasource.getPets();
      if (result.statusCode == 200) {
        final appResponse = AppResponse<List<PetEntity>>.fromJson(
          result.data,
          (json) {
            return (json as List).map((json) {
              return PetModel.fromMap(
                json as Map<String, dynamic>,
              );
            }).toList();
          },
        );
        return Success(appResponse);
      }

      if (result.statusCode == 401) {
        return Failure(
          UnauthorizedException(
            message: result.data['message'],
          ),
        );
      }

      return Failure(
          ServerException(message: 'Error', error: result.data['message']));
    } catch (e) {
      return Failure(ServerException(message: 'Error', error: e.toString()));
    }
  }
}
