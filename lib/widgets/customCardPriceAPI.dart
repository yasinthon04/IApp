import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iapp_flutter/screens/people/editApi.dart';
import 'package:iapp_flutter/widgets/constants.dart';

class CustomCardPriceApi extends StatelessWidget {
  final int userId;

  final String imageUrl;

  const CustomCardPriceApi({
    Key? key,
    required this.userId,
    this.imageUrl = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [
              Constants.navColor.withOpacity(0.9),
              Constants.navColor,
            ],
          ),
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
            color: Colors.grey.withOpacity(0.2),
            width: 2,
          ),
        ),
        child: SizedBox(
          height: screenWidth * 0.15,
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.account_balance_wallet,
                          color: Constants.orangeColor,
                          size: 35,
                        ),
                        SizedBox(width: screenWidth * 0.05),
                        Text(
                          userId == 0 ? 'No User' : 'userId_$userId',
                          style: TextStyle(
                            fontSize: screenWidth * 0.035,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '\$ 100.50',
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        color: Colors.white,
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
