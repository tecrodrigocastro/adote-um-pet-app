import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../../core/client_http/app_response.dart';
import '../../../../../core/command/command.dart';
import '../../../../../core/typedefs/types.dart';
import '../../../auth/domain/usecases/logout_usecase.dart';
import '../../domain/dtos/get_pets_params.dart';
import '../../domain/entities/pet_entity.dart';
import '../../domain/usecases/get_pet_usecase.dart';

class HomeViewmodel extends ChangeNotifier {
  HomeViewmodel({
    required GetPetUsecase getPetUsecase,
    required LogoutUsecase logoutUsecase,
  })  : _getPetUsecase = getPetUsecase,
        _logoutUsecase = logoutUsecase,
        super() {
    getPetCommand = Command1(_getPet);
    logoutCommand = Command0(_logoutUsecase.call);
  }

  late final Command1<AppResponse<List<PetEntity>>, GetPetsParams>
      getPetCommand;
  late final Command0<Unit> logoutCommand;

  late final GetPetUsecase _getPetUsecase;
  late final LogoutUsecase _logoutUsecase;

  late final List<PetEntity> _pets;

  List<PetEntity> get pets => UnmodifiableListView(_pets);

  Output<AppResponse<List<PetEntity>>> _getPet(GetPetsParams params) async {
    return _getPetUsecase(params).onSuccess((appResponse) {
      if (appResponse.data != null) {
        _pets = appResponse.data!;
        notifyListeners();
      }
    });
  }
}
