part of 'log_in_bloc.dart';

@immutable
abstract class LogInState {}

abstract class LogInActionState implements LogInState {}

class LogInInitial extends LogInState {}

class AccountCreatedState extends LogInState {}

class HomeNavigateState extends LogInActionState {}

class LoadingState implements LogInState {
 final bool isLoading;
  LoadingState(this.isLoading);
}

class ErrorState implements LogInActionState {
  final String message;
  ErrorState(this.message);
}
