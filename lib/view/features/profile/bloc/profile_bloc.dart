import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileInitialState(null)) {
    on<DeleteAccountEvent>(deleteAccountEvent);
    on<FetchAccountEvent>(fetchAccountEvent);
  }

  FutureOr<void> deleteAccountEvent(
      DeleteAccountEvent event, Emitter<ProfileState> emit) async {
    emit(const LoadingState(true));
    await Future.delayed(const Duration(seconds: 2), () {
      User? user = FirebaseAuth.instance.currentUser;
      user?.delete();
      // emit(ProfileInitialState(user));
    });
  }

  FutureOr<void> fetchAccountEvent(
      FetchAccountEvent event, Emitter<ProfileState> emit) {
    emit(const LoadingState(true));
    User? user = FirebaseAuth.instance.currentUser;
    emit(ProfileInitialState(user));
  }
}
