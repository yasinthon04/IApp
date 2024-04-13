import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iapp_flutter/widgets/appbar.dart';
import 'package:iapp_flutter/widgets/constants.dart';
import 'package:iapp_flutter/widgets/customCard.dart';
import 'package:iapp_flutter/widgets/navbar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _searchQuery = "";
  int _selectedTabIndex = 0;

  Widget _buildSearchBox() {
    return TextField(
      onChanged: (value) {
        setState(() {
          _searchQuery = value;
        });
      },
      decoration: InputDecoration(
        hintText: "Search...",
        hintStyle: TextStyle(color: Colors.grey[500]),
        fillColor: Constants.searchColor,
        filled: true,
        prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
        suffixIcon: _searchQuery.isNotEmpty
            ? IconButton(
                icon: Icon(Icons.clear, color: Colors.grey[500]),
                onPressed: () {
                  setState(() {
                    _searchQuery = "";
                  });
                },
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    final List<Map<String, String>> items = [
      {
        'name': 'Alice',
        'description': 'Description for Alice',
        'imageUrl': 'https://via.placeholder.com/150'
      },
      {
        'name': 'Bob',
        'description': 'Description for Bob',
        'imageUrl': 'https://via.placeholder.com/150'
      },
    ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DefaultTabController(
          length: 1,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        _buildTabText("All", 0),
                        SizedBox(width: 48),
                        _buildTabText("API", 1),
                        SizedBox(width: 48),
                        _buildTabText("API", 2),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add, color: Constants.greyTextColor),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    if (_selectedTabIndex == 0)
                      ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return CustomCard(
                            name: items[index]['name']!,
                            description: items[index]['description']!,
                            imageUrl: items[index]['imageUrl']!,
                          );
                        },
                      ),
                    if (_selectedTabIndex == 1) _buildTabAPI(),
                    if (_selectedTabIndex == 2) _buildTabAPI(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTabText(String tabName, int index) {
    final bool isSelected = index == _selectedTabIndex;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        child: Text(
          tabName,
          style: TextStyle(
            // Change the color to orange if the tab is selected, otherwise use the default grey color.
            color: isSelected ? Constants.orangeColor : Constants.greyTextColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildTabAPI() {
    return const Text(
      'API',
      style: TextStyle(color: Constants.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'API Translation',
                style: TextStyle(
                  color: Constants.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              _buildSearchBox(),
              SizedBox(height: 20),
              _buildTabBar(),
            ],
          ),
        ),
      ),
    );
  }
}
