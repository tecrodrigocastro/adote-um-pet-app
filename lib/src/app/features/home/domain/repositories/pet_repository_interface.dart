import '../../../../../core/client_http/app_response.dart';
import '../../../../../core/typedefs/types.dart';
import '../entities/pet_entity.dart';

abstract interface class IPetRepository {
  Output<AppResponse<List<PetEntity>>> getPets({
    String? type,
    String? gender,
    String? size,
  });
}
