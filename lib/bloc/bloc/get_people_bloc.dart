import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iapp_flutter/models/people.dart';
import 'package:iapp_flutter/services/loadJson.dart';
import 'package:meta/meta.dart';

part 'get_people_event.dart';
part 'get_people_state.dart';

class GetPeppleBloc extends Bloc<GetPeopleEvent, GetPeopleState> {
  GetPeppleBloc() : super(GetPeopleInitial()) {
    on<LoadingPeopleEvent>((event, emit) async {
  try {
    emit(LoadingState());
    final List<PeopleModel> peopleList = await Database.getPeople(); // Adjusted to expect List<PeopleModel> directly
    PeopleList peoples = PeopleList(peopleList);
    emit(PeopleLoadedState(peoples));
  } catch (e) {
    print('Error loading people: $e');
    emit(GetPeopleError());
  }
});

  }
}
