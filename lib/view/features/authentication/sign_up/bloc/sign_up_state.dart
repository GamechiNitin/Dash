part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {}

abstract class SignUpActionState implements SignUpState {}

class SignUpInitial extends SignUpState {}

class AccountCreatedState extends SignUpState {}

class HomeNavigateState extends SignUpActionState {}

class LoadingState implements SignUpState {
  final bool isLoading;
  LoadingState(this.isLoading);
}

class ErrorState implements SignUpActionState {
  final String message;
  ErrorState(this.message);
}
