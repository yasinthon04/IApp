import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iapp_flutter/bloc/bloc/get_people_bloc.dart';
import 'package:iapp_flutter/models/people.dart';
import 'package:iapp_flutter/services/loadJson.dart';
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
  PeopleModel? peopleModel;

  @override
  void initState() {
    super.initState();
    context.read<GetPeppleBloc>().add(LoadingPeopleEvent());
  }

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

  Widget _buildTabBar(List<PeopleModel> peopleList) {
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
                        SizedBox(width: 32),
                        _buildTabText("API", 1),
                        SizedBox(width: 32),
                        _buildTabText("API", 2),
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Constants.orangeColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.add, color: Constants.white),
                      onPressed: () {
                        // Add your onPressed function here
                      },
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              _buildCard(peopleList),
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
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildCard(List<PeopleModel> peopleList) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          if (_selectedTabIndex == 0)
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: peopleList.length,
              itemBuilder: (context, index) {
                final person = peopleList[index];
                return CustomCard(
                  name: person.name,
                  description: person.description,
                  imageUrl: person.imageUrl,
                );
              },
            ),
          if (_selectedTabIndex == 1) _buildTabAPI(),
          if (_selectedTabIndex == 2) _buildTabAPI(),
        ],
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
              BlocBuilder<GetPeppleBloc, GetPeopleState>(
                builder: (context, state) {
                  if (state is LoadingState) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is PeopleLoadedState) {
                    if (state.peopleList.data.isNotEmpty) {
                      return _buildTabBar(state.peopleList.data);
                    } else {
                      return Text("No data available");
                    }
                  }
                  return Center(child: Text("Error"));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
