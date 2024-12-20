import '../../../../../core/client_http/app_response.dart';
import '../../../../../core/typedefs/types.dart';
import '../../../../../core/usecase/usecase_interface.dart';
import '../dtos/get_pets_params.dart';
import '../entities/pet_entity.dart';
import '../repositories/pet_repository_interface.dart';

class GetPetUsecase
    implements UseCase<AppResponse<List<PetEntity>>, GetPetsParams> {
  final IPetRepository _petRepository;

  GetPetUsecase({
    required IPetRepository petRepository,
  }) : _petRepository = petRepository;

  @override
  Output<AppResponse<List<PetEntity>>> call(GetPetsParams params) {
    return _petRepository.getPets(
      size: params.size,
      type: params.type,
      gender: params.gender,
    );
  }
}
