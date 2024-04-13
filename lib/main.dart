

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iapp_flutter/bloc/bloc/get_people_bloc.dart';
import 'package:iapp_flutter/screens/controlNav.dart';
import 'package:iapp_flutter/screens/home.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
    BlocProvider<GetPeppleBloc>(
      create: (context) => GetPeppleBloc())
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
