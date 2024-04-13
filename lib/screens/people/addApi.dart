import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iapp_flutter/models/people.dart';
import 'package:iapp_flutter/widgets/constants.dart';
import 'package:path_provider/path_provider.dart';

class AddApi extends StatefulWidget {
  const AddApi({super.key});

  @override
  _AddApiState createState() => _AddApiState();
}

class _AddApiState extends State<AddApi> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _apiController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final List<PeopleModel> _peopleList = [];

  @override
  void dispose() {
    _nameController.dispose();
    _apiController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _emailController.dispose();

    super.dispose();
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      style: TextStyle(
          color: Colors.white,
          fontSize: MediaQuery.of(context).size.width * 0.03),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.width * 0.03),
        filled: true,
        fillColor: Colors.black.withOpacity(0.5),
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(16),
        ),
        contentPadding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.width * 0.05, horizontal: 20),
        isDense: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Responsive padding
    double padding = MediaQuery.of(context).size.width > 600 ? 24.0 : 16.0;
    double textButtonPadding =
        MediaQuery.of(context).size.width > 600 ? 24.0 : 16.0;

    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      appBar: AppBar(
        backgroundColor: Constants.backgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Constants.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(padding),
            margin: EdgeInsets.all(padding),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 34, 39, 42).withOpacity(0.5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 24),
                Text(
                  'Add API',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.06,
                      fontWeight: FontWeight.bold,
                      color: Constants.white),
                ),
                const SizedBox(height: 24),
                _buildTextField('Name', _nameController),
                const SizedBox(height: 24),
                _buildTextField('API', _apiController),
                const SizedBox(height: 24),
                _buildTextField('Phone', _phoneController),
                const SizedBox(height: 24),
                _buildTextField('Address', _addressController),
                const SizedBox(height: 24),
                _buildTextField('Email', _emailController),
                const SizedBox(height: 24),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 64),
            child: ElevatedButton(
              onPressed: _submitForm,
              child: Text('Confirm',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                  )),
              style: ElevatedButton.styleFrom(
                backgroundColor: Constants.orangeColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.2, vertical: textButtonPadding),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _submitForm() async {
    final newPerson = PeopleModel(
      name: _nameController.text,
      api: _apiController.text,
      phone: _phoneController.text,
      address: _addressController.text,
      email: _emailController.text,
      imageUrl:
          'https://via.placeholder.com/150', // Default or user-provided URL
    );

    setState(() {
      _peopleList.add(newPerson);
      print('name: ${newPerson.name}');
      print('api: ${newPerson.api}');
      print('phone: ${newPerson.phone}');
      print('address: ${newPerson.address}');
      print('email: ${newPerson.email}');
    });

    await _writeToJsonFile(_peopleList);
    // Clear text fields
    _nameController.clear();
    _apiController.clear();
    _phoneController.clear();
    _addressController.clear();
    _emailController.clear();
  }
}

Future<void> _writeToJsonFile(List<PeopleModel> people) async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/peopleData.json');
  List<Map<String, dynamic>> jsonData = people
      .map((person) => {
            'name': person.name,
            'api': person.api,
            'phone': person.phone,
            'address': person.address,
            'email': person.email,
            'imageUrl': person.imageUrl,
          })
      .toList();

  await file.writeAsString(json.encode(jsonData));
}
