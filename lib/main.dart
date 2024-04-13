

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iapp_flutter/bloc/get_api/get_api_bloc.dart';
import 'package:iapp_flutter/bloc/get_people/get_people_bloc.dart';
import 'package:iapp_flutter/screens/controlNav.dart';
import 'package:iapp_flutter/screens/home.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
    BlocProvider<GetPeppleBloc>(
      create: (context) => GetPeppleBloc()),
    BlocProvider<GetApiBloc>(
      create: (context) => GetApiBloc()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ControlNav(),
    );
  }
}
