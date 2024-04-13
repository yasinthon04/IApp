import 'package:flutter/material.dart';
import 'package:iapp_flutter/models/people.dart';
import 'package:iapp_flutter/widgets/constants.dart'; // Ensure this import path is correct.

class DetailsApiPage extends StatefulWidget {
  final PeopleModel person;

  const DetailsApiPage({
    Key? key,
    required this.person,
  }) : super(key: key);

  @override
  _DetailsApiPageState createState() => _DetailsApiPageState();
}

class _DetailsApiPageState extends State<DetailsApiPage> {
  int? _selectedItem = 0;

  Widget _buildImage() {
    double radius = MediaQuery.of(context).size.width * 0.35; // Responsive radius
    return CircleAvatar(
      radius: radius,
      backgroundImage: NetworkImage(widget.person.imageUrl),
    );
  }

  Widget _buildBody() {
    double padding = MediaQuery.of(context).size.width * 0.05; // Responsive padding
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: SingleChildScrollView( // Ensures scrollability on smaller devices
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildTopSection(),
                SizedBox(height: padding),
                _buildAddressSection(),
                SizedBox(height: padding),
                _buildEmailSection(),
                SizedBox(height: padding),
                _buildPriceSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded( // Prevents overflow by expanding based on available space
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('API',
                  style: TextStyle(fontSize: 24, color: Constants.white, fontWeight: FontWeight.bold)),
              const SizedBox(height: 32),
              Text(widget.person.name,
                  style: const TextStyle(fontSize: 16, color: Constants.white)),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Constants.navColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(widget.person.phone,
              style: TextStyle(fontSize: 16, color: Constants.white, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  Widget _buildAddressSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Address',
            style: TextStyle(fontSize: 16, color: Constants.white, fontWeight: FontWeight.bold)),
        SizedBox(height: 16),
        Text(widget.person.address,
            style: const TextStyle(fontSize: 16, color: Constants.white)),
      ],
    );
  }

  Widget _buildEmailSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Email',
            style: TextStyle(fontSize: 16, color: Constants.white, fontWeight: FontWeight.bold)),
        SizedBox(height: 16),
        Text(widget.person.email,
            style: const TextStyle(fontSize: 16, color: Constants.white)),
      ],
    );
  }

  Widget _buildPriceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Price',
            style: TextStyle(fontSize: 16, color: Constants.white, fontWeight: FontWeight.bold)),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildPrice(0, '100\$'),
            _buildPrice(1, '200\$'),
            _buildPrice(2, '300\$'),
          ],
        )
      ],
    );
  }

  Widget _buildPrice(int index, String text) {
    bool isSelected = _selectedItem == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItem = index;
        });
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(32, 8, 32, 8),
        decoration: BoxDecoration(
          color: Constants.navColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Constants.orangeColor : Colors.transparent,
            width: 2,
          ),
        ),
        child: Text(text,
            style: TextStyle(
              fontSize: 16,
              color: isSelected
                  ? Constants.orangeColor
                  : Constants.greyTextColor,
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.navColor,
      appBar: AppBar(
        backgroundColor: Constants.navColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Constants.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          _buildImage(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03), // Responsive vertical spacing
          _buildBody(),
        ],
      ),
    );
  }
}
