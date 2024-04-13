part of 'get_people_bloc.dart';




sealed class GetPeopleState extends Equatable {
  const GetPeopleState();
  
  @override
  List<Object> get props => [];
}

final class GetPeopleInitial extends GetPeopleState {}
class LoadingState extends GetPeopleState {}
class GetPeopleError extends GetPeopleState {}
class PeopleLoadedState extends GetPeopleState {
  final PeopleList peopleList;

  PeopleLoadedState(this.peopleList);

  @override
  List<Object> get props => [peopleList];
}
