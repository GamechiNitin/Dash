part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {
  final User? user;
  final bool isLoading;

  const ProfileState({this.user, this.isLoading = false});
}

class ProfileInitialState extends ProfileState {
  final User? userData;

  const ProfileInitialState(this.userData) : super(user: userData);
}

class LoadingState extends ProfileState {
  final bool loading;

  const LoadingState(this.loading) : super(isLoading: loading);
}
