import 'dart:developer';

import 'package:dash/utils/imports.dart';

part 'log_in_event.dart';
part 'log_in_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  LogInBloc() : super(LogInInitial()) {
    on<LogInToAccountEvent>(logInToAccountEvent);
  }

  FutureOr<void> logInToAccountEvent(
      LogInToAccountEvent event, Emitter<LogInState> emit) async {
    emit(LoadingState(true));

    final response = await AuthRepository.logIn(event.userModel);
    if (response.$1 == "200" && response.$2 != null) {
      log(response.$2!.id.toString());
      emit(AccountCreatedState());
      bool currentUser = await LocalDatabase.saveCurrentUser(response.$2!);
      if (currentUser) {
        emit(HomeNavigateState());
      } else {
        emit(ErrorState("Not able to save user. Try again Later!"));
      }
    } else {
      emit(ErrorState(response.$1));
      emit(LoadingState(false));
    }
  }
}
