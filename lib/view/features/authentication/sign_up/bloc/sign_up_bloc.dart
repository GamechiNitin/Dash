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
    if (response.$1 == "200") {
      emit(HomeNavigateState());
    } else {
      emit(ErrorState(response.$1));
    }
    emit(LoadingState(false));
  }
}
