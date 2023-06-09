part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}


class CreateAccountEvent implements SignUpEvent {
  final UserModel userModel;
  CreateAccountEvent(this.userModel);
}
