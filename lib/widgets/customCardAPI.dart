import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iapp_flutter/screens/people/editApi.dart';
import 'package:iapp_flutter/widgets/constants.dart';

class CustomCardApi extends StatelessWidget {
  final int userId;
  final int id;
  final String title;
  final String body;
  final String imageUrl;

  const CustomCardApi({
    Key? key,
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
    this.imageUrl = 'https://cdn.pixabay.com/photo/2017/07/18/23/23/user-2517433_1280.png',
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
        ),
        child: SizedBox(
          height: screenWidth * 0.6,
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          imageUrl.isNotEmpty ? NetworkImage(imageUrl) : null,
                      radius: screenWidth * 0.08,
                    ),
                    SizedBox(width: screenWidth * 0.05),
                    Text(
                      userId == 0 ? 'No User' : 'User_$userId',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenWidth * 0.07),
                Flexible(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: Constants.orangeColor,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Flexible(
                  child: Text(
                    body,
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: Constants.white,

                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
