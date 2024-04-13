part of 'get_api_bloc.dart';

@immutable
abstract class GetApiEvent extends Equatable {
  const GetApiEvent();

  @override
  List<Object> get props => [];
}
class LoadApiEvent extends GetApiEvent {

}