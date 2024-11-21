import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'donate_event.dart';
part 'donate_state.dart';

class DonateBloc extends Bloc<DonateEvent, DonateState> {
  DonateBloc() : super(DonateInitial()) {
    on<DonateEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
