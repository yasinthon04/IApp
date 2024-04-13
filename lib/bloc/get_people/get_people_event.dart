part of 'get_people_bloc.dart';

@immutable
abstract class GetPeopleEvent extends Equatable {
  const GetPeopleEvent();

  @override
  List<Object> get props => [];
}
class LoadingPeopleEvent extends GetPeopleEvent {

}