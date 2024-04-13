part of 'get_api_bloc.dart';

sealed class GetApiState extends Equatable {
  const GetApiState();

  @override
  List<Object> get props => [];
}

final class GetApiInitial extends GetApiState {}

class LoadingState extends GetApiState {}

class GetApiError extends GetApiState {}

class ApiLoadedState extends GetApiState {
  final ApiList apiList;

  ApiLoadedState(this.apiList);

  @override
  List<Object> get props => [apiList];
}
