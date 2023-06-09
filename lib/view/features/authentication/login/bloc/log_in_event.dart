part of 'log_in_bloc.dart';

@immutable
abstract class LogInEvent {}

class LogInToAccountEvent implements LogInEvent {
  final UserModel userModel;
  LogInToAccountEvent(this.userModel);
}