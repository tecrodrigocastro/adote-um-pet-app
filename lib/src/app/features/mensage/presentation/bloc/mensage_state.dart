part of 'mensage_bloc.dart';

abstract class MensageState extends Equatable {
  const MensageState();

  @override
  List<Object> get props => [];
}

class MensageInitial extends MensageState {}

class MensageLoading extends MensageState {}
