import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/client_http/app_response.dart';
import '../../../../../core/errors/errors.dart';
import '../../domain/dtos/get_pets_params.dart';
import '../../domain/entities/pet_entity.dart';
import '../../domain/usecases/get_pet_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetPetUsecase _getPetUsecase;

  HomeBloc({
    required GetPetUsecase getPetUsecase,
  })  : _getPetUsecase = getPetUsecase,
        super(HomeInitial()) {
    on<GetPetsEvent>((event, emit) async {
      emit(GetPetsLoading()); //!STATE de loading

      final result = await _getPetUsecase(event.getPetsParams);
      result.fold((success) {
        emit(GetPetsSuccess(success));
      }, (failure) {
        emit(GetPetsFailure(failure));
      });
    });
  }
}
