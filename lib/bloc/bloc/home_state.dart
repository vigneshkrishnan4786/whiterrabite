part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class LoadUserDataStart extends HomeState {}

class LoadUserDataSuccess extends HomeState {
  final List<UserModel>? userModel;
  LoadUserDataSuccess(this.userModel);
}

class LoadUserDataFaild extends HomeState {}

class SearchDataSuccess extends HomeState {
  final String userModel;
  SearchDataSuccess(this.userModel);
}
