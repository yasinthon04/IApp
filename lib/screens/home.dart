import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iapp_flutter/bloc/get_people/get_people_bloc.dart';
import 'package:iapp_flutter/models/people.dart';
import 'package:iapp_flutter/screens/people/addApi.dart';
import 'package:iapp_flutter/screens/people/detailsApi.dart';
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
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<GetPeppleBloc>().add(LoadingPeopleEvent());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Widget _buildSearchBox() {
    return TextField(
      controller: _searchController,
      onChanged: (value) {
        setState(() {
          _searchQuery = value;
        });
      },
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "Search...",
        hintStyle: TextStyle(
            color: Colors.grey[500],
            fontSize: MediaQuery.of(context).size.width * 0.03),
        fillColor: Constants.searchColor,
        filled: true,
        prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
        suffixIcon: _searchQuery.isNotEmpty
            ? IconButton(
                icon: Icon(Icons.clear, color: Colors.grey[500]),
                onPressed: () {
                  setState(() {
                    _searchQuery = "";
                    _searchController.clear();
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
    return DefaultTabController(
      length: 1,
      child: Expanded(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    _buildTabText("All", 0),
                    SizedBox(width: 32),
                    _buildTabText("API", 1),
                    SizedBox(width: 32),
                    _buildTabText("API", 2),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.width * 0.1,
                  width: MediaQuery.of(context).size.width * 0.1,
                  decoration: BoxDecoration(
                    color: Constants.orangeColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.add, color: Constants.white),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AddApi(),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Expanded(
                child: TabBarView(children: [
              if (_selectedTabIndex == 0)
                BlocBuilder<GetPeppleBloc, GetPeopleState>(
                  builder: (context, state) {
                    if (state is LoadingState) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state is PeopleLoadedState) {
                      if (state.peopleList.data.isNotEmpty) {
                        return _buildCardList(state.peopleList.data);
                      } else {
                        return Text("No data available");
                      }
                    }
                    return Container();
                  },
                ),
              if (_selectedTabIndex == 1) _buildTabAPI(),
              if (_selectedTabIndex == 2) _buildTabAPI(),
            ])),
          ],
        ),
      ),
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              tabName,
              style: TextStyle(
                color: isSelected
                    ? Constants.orangeColor
                    : Constants.greyTextColor,
                fontSize: MediaQuery.of(context).size.width * 0.03,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2),
            if (isSelected)
              Container(
                width: 5,
                height: 5,
                decoration: BoxDecoration(
                  color: Constants.orangeColor,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardList(List<PeopleModel> peopleList) {
    // Filter the people list based on the search query.
    List<PeopleModel> filteredList = peopleList.where((person) {
      return person.name.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: filteredList.length,
      itemBuilder: (context, index) {
        final person = filteredList[index];
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailsApiPage(
                  person: person,
                ),
              ),
            );
          },
          child: CustomCard(
            name: person.name,
            api: person.api,
            imageUrl: person.imageUrl,
          ),
        );
      },
    );
  }

  Widget _buildTabAPI() {
    return Center(
        child: Text('Content of API tab',
            style: TextStyle(color: Constants.white)));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'API Translation',
              style: TextStyle(
                color: Constants.white,
                fontSize: screenWidth * 0.06,
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
    );
  }
}
