part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class LoadUserData extends HomeEvent {}

class SearchData extends HomeEvent {
  final String searcData;

  SearchData(this.searcData);
}
