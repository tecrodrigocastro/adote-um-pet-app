part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetPetsEvent extends HomeEvent {
  final GetPetsParams getPetsParams;

  const GetPetsEvent({
    required this.getPetsParams,
  });

  @override
  List<Object> get props => [getPetsParams];
}
