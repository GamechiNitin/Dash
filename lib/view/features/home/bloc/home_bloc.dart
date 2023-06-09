
import 'package:dash/repository/product_repo.dart';
import 'package:dash/utils/imports.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(LoadingState());
    final response = await ProductRepository.fetchAllProduct();
    if (response.$1 == "200" && response.$2 != null) {
      emit(HomeFetchedSuccessState(response.$2!));
    } else {
      emit(ErrorState(response.$1));
    }
  }
}
