part of 'mensage_bloc.dart';

abstract class MensageEvent extends Equatable {
  const MensageEvent();

  @override
  List<Object> get props => [];
}

class SendMessage extends MensageEvent {
  final String message;
  final String userId1;
  final String userId2;

  const SendMessage({
    required this.message,
    required this.userId1,
    required this.userId2,
  });

  @override
  List<Object> get props => [message, userId1, userId2];
}
