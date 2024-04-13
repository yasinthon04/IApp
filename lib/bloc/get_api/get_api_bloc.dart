import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:iapp_flutter/models/api.dart';
import 'package:iapp_flutter/services/apiServices.dart';

part 'get_api_event.dart';
part 'get_api_state.dart';
class GetApiBloc extends Bloc<GetApiEvent, GetApiState> {
  List<ApiModel>? _cachedApiModel;

  GetApiBloc() : super(GetApiInitial()) {
    on<LoadApiEvent>(_onLoadApi);
  }

  void _onLoadApi(LoadApiEvent event, Emitter<GetApiState> emit) async {
    if (_cachedApiModel != null) {
      emit(ApiLoadedState(ApiList(_cachedApiModel!)));
      return;
    }

    try {
      emit(LoadingState());
      final List<ApiModel> apiModel = await ApiServices.getApi();
      _cachedApiModel = apiModel;
      emit(ApiLoadedState(ApiList(apiModel)));
    } catch (e) {
      emit(GetApiError());
      print('Exception occurred: $e');
    }
  }
}
