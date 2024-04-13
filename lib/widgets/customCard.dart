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
    double screenWidth = MediaQuery.of(context).size.width;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Constants.navColor.withOpacity(0.9),
              Constants.navColor,
            ],
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: SizedBox(
          height: screenWidth * 0.45,
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          imageUrl.isNotEmpty ? NetworkImage(imageUrl) : null,
                      radius: screenWidth * 0.08,
                    ),
                    IconButton(
                      iconSize: screenWidth * 0.06,
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        // Delete action
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
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: screenWidth * 0.03,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    IconButton(
                      iconSize: screenWidth * 0.06,
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                        // Edit action
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
