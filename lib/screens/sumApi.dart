import 'package:flutter/material.dart';

class SumApiPage extends StatefulWidget {
  @override
  _SumApiPageState createState() => _SumApiPageState();
}

class _SumApiPageState extends State<SumApiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SumApi'),
      ),
      body: Center(
        child: Text(
          'SumApi Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}