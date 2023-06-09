import 'dart:developer';

import 'package:dash/utils/imports.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<CreateAccountEvent>(createAccountEvent);
  }

  FutureOr<void> createAccountEvent(
      CreateAccountEvent event, Emitter<SignUpState> emit) async {
    emit(LoadingState(true));
    final response = await AuthRepository.createAccount(event.userModel);
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
