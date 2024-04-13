import 'package:flutter/material.dart';
import 'package:iapp_flutter/widgets/constants.dart';

class CustomCard extends StatelessWidget {
  final String name;
  final String description;
  final String imageUrl;

  const CustomCard({
    Key? key,
    required this.name,
    required this.description,
    this.imageUrl = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get screen size
    double screenWidth = MediaQuery.of(context).size.width;

    return Card(
      color: Constants.navColor,
      child: SizedBox(
        height: screenWidth * 0.5, // Responsive height based on screen width
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05), // Responsive padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundImage:
                        imageUrl.isNotEmpty ? NetworkImage(imageUrl) : null,
                    radius: screenWidth * 0.1, 
                  ),
                  IconButton(
                    iconSize: screenWidth * 0.08, 
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () {
                      // Edit action
                    },
                  ),
                ],
              ),
              SizedBox(height: screenWidth * 0.02), 
              Text(
                name,
                style: TextStyle(
                  fontSize: screenWidth * 0.04, 
                  fontWeight: FontWeight.bold,
                  color: Constants.white,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    description,
                    style: TextStyle(
                      fontSize:
                          screenWidth * 0.035, 
                      color: Constants.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  IconButton(
                    iconSize: screenWidth * 0.08, 
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      // Delete action
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
