import 'package:flutter/material.dart';
import 'package:iapp_flutter/widgets/appbar.dart';
import 'package:iapp_flutter/widgets/constants.dart';
import 'package:iapp_flutter/widgets/navbar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _searchQuery = "";

  Widget _buildSearchBox() {
    return TextField(
      onChanged: (value) {
        setState(() {
          _searchQuery = value;
        });
        // You can also initiate a search operation here if needed
      },
      decoration: InputDecoration(
        hintText: "Search...",
        fillColor: Colors.white,
        filled: true,
        prefixIcon: Icon(Icons.search),
        suffixIcon: _searchQuery.isNotEmpty
            ? IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  setState(() {
                    _searchQuery = "";
                  });
                  // Clear search operation or results if needed
                },
              )
            : null, // Only show the clear icon if there is a search query
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'API Translation',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            _buildSearchBox(),
          ],
        ),
      ),
    );
  }
}
