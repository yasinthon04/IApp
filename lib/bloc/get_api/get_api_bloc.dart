import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:iapp_flutter/models/api.dart';
import 'package:iapp_flutter/services/apiServices.dart';

part 'get_api_event.dart';
part 'get_api_state.dart';

class GetApiBloc extends Bloc<GetApiEvent, GetApiState> {
  GetApiBloc() : super(GetApiInitial()) {
    on<GetApiEvent>((event, emit) async {
      try {
        emit(LoadingState());
        final List<ApiModel> apiModel = await ApiServices.getApi();

        ApiList apiList = ApiList(apiModel);
        emit(ApiLoadedState(apiList));
      } catch (e) {
        emit(GetApiError());
        print('Exception occurred: $e');
      }
    });
  }
}
