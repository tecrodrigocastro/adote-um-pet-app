import 'package:flutter/cupertino.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../../core/client_http/app_response.dart';
import '../../../../../core/command/command.dart';
import '../../../../../core/typedefs/types.dart';
import '../../domain/dtos/get_pets_params.dart';
import '../../domain/entities/pet_entity.dart';
import '../../domain/usecases/get_pet_usecase.dart';

class HomeViewmodel extends ChangeNotifier {
  HomeViewmodel({
    required GetPetUsecase getPetUsecase,
  })  : _getPetUsecase = getPetUsecase,
        super() {
    getPet = Command1(_getPet);
  }

  late final Command1<AppResponse<List<PetEntity>>, GetPetsParams> getPet;

  late final GetPetUsecase _getPetUsecase;

  late final List<PetEntity> _pets;

  List<PetEntity> get pets => List.unmodifiable(_pets);

  Output<AppResponse<List<PetEntity>>> _getPet(GetPetsParams params) async {
    return _getPetUsecase(params).onSuccess((appResponse) {
      if (appResponse.data != null) {
        _pets = appResponse.data!;
        notifyListeners();
      }
    });
  }
}
