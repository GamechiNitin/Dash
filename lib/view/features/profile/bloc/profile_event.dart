part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class DeleteAccountEvent extends ProfileEvent {}

class FetchAccountEvent extends ProfileEvent {}
