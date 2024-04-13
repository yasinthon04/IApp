import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iapp_flutter/screens/people/editApi.dart';
import 'package:iapp_flutter/widgets/constants.dart';

class CustomCard extends StatelessWidget {
  final String name;
  final String api;
  final String imageUrl;

  const CustomCard({
    Key? key,
    required this.name,
    required this.api,
    this.imageUrl = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    void _showDeleteConfirmationDialog(BuildContext context) {
      showDialog(
        context: context,
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.1),
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.black,
            title: const Text('Delete API',
                style: TextStyle(color: Constants.white)),
            content: const Text(
              'Are you sure you want to delete this item?',
              style: TextStyle(color: Constants.white),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel',
                    style: TextStyle(color: Constants.white)),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    print("Item deleted");
                  },
                  child: TextButton(
                    onPressed: () {
                      // Perform the deletion or any other processing
                      // Then close the dialog
                      Navigator.of(context).pop();
                      print("Item deleted"); // For example purposes
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 16), // Padding inside the container
                      decoration: BoxDecoration(
                        color:
                            Colors.red, // Background color of the container
                        borderRadius: BorderRadius.circular(
                            4), // Rounded corners for the container
                      ),
                      child: Text(
                        'Delete',
                        style: TextStyle(
                          color: Colors
                              .white, // Text color changed to white for better contrast
                        ),
                      ),
                    ),
                  )),
            ],
          );
        },
      );
    }

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
                    Container(
                      height: screenWidth * 0.1,
                      width: screenWidth * 0.1,
                       decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        iconSize: screenWidth * 0.06,
                        icon: const Icon(Icons.delete_outline, color: Colors.red),
                        onPressed: () {
                          _showDeleteConfirmationDialog(context);
                        },
                      ),
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
                    Flexible(
                      child: Text(
                        api,
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      height: screenWidth * 0.1,
                      width: screenWidth * 0.1,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        iconSize: screenWidth * 0.06,
                        icon:  Icon(Icons.edit_outlined, color: Colors.grey.shade900),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EditApi(),
                            ),
                          );
                        },
                      ),
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
