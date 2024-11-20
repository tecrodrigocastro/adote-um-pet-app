import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'mensage_event.dart';
part 'mensage_state.dart';

class MensageBloc extends Bloc<MensageEvent, MensageState> {
  MensageBloc() : super(MensageInitial()) {
    on<SendMessage>((event, emit) {
      event.message;
      // TODO: implement event handler
    });
  }
}
