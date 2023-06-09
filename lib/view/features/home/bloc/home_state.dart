part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

abstract class HomeActionState implements HomeState {}

class LoadingState implements HomeState {}

class ErrorState implements HomeActionState {
  final String message;
  ErrorState(this.message);
}

class HomeFetchedSuccessState extends HomeState {
  final List<StoreProductModel> productsList;

  HomeFetchedSuccessState(this.productsList);
}

class HomeAddedState extends HomeState {}
