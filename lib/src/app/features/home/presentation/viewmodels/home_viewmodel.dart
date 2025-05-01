import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../../core/client_http/app_response.dart';
import '../../../../../core/command/command.dart';
import '../../../../../core/services/session_service.dart';
import '../../../../../core/typedefs/types.dart';
import '../../../auth/domain/entities/user_entity.dart';
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
    init();
  }

  final SessionService _sessionService = GetIt.I.get<SessionService>();
  UserEntity _loggedUser = UserEntity.empty();
  UserEntity get loggeduser => _loggedUser;

  Future<void> init() async {
    await _sessionService.getUser().map((user) => _loggedUser = user);
    notifyListeners();
  }

  late final Command1<AppResponse<List<PetEntity>>, GetPetsParams>
      getPetCommand;
  late final Command0<Unit> logoutCommand;

  late final GetPetUsecase _getPetUsecase;
  late final LogoutUsecase _logoutUsecase;

  int _currentPetIndex = 0;
  PetEntity get currentPet => _pets[_currentPetIndex];
  List<PetEntity> _pets = [];
  List<PetEntity> get pets => UnmodifiableListView(_pets);

  bool get showNextButton => _currentPetIndex < pets.length;
  bool get showPreviousButton => _currentPetIndex != 0;

  Output<AppResponse<List<PetEntity>>> _getPet(GetPetsParams params) async {
    return _getPetUsecase(params).onSuccess((appResponse) {
      if (appResponse.data != null) {
        _pets = appResponse.data!;
        notifyListeners();
      }
    }).onFailure((error) {});
  }

  void onTapNext() {
    _currentPetIndex++;
    notifyListeners();
  }

  void onTapPrevious() {
    _currentPetIndex--;
    notifyListeners();
  }

  void onTapChat() {
    // Implement chat functionality here
  }
}
