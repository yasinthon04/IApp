import 'package:flutter/material.dart';
import 'package:iapp_flutter/widgets/constants.dart';
import 'package:iapp_flutter/widgets/navbar.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      body: Center(
        child: Text(
          'Welcome to the Home Screen!',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

    );
  }
}
