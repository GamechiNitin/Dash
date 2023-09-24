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
    if (response.$1 != "200") {
      emit(ErrorState(response.$1));
    }
    emit(LoadingState(false));
  }
}
