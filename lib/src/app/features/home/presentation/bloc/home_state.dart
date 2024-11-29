part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

//?Loading
class GetPetsLoading extends HomeState {}

//?Success
class GetPetsSuccess extends HomeState {
  final AppResponse<List<PetEntity>> data;

  const GetPetsSuccess(
    this.data,
  );

  @override
  List<Object> get props => [data];
}

//?Failure
class GetPetsFailure extends HomeState {
  final BaseException exception;

  const GetPetsFailure(
    this.exception,
  );

  String get message => exception.message;

  @override
  List<Object> get props => [exception];
}
