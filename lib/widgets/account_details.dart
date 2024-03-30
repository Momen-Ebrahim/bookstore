import 'package:bookstore/constants.dart';
import 'package:flutter/material.dart';

class AccountDetails extends StatelessWidget {
  const AccountDetails({super.key, required this.title, required this.value});
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    return Container(
      height: hight * (70 / 800),
      color: const Color(0xFFdedede),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              '$title : ',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: getResponsiveFontSize(context, fontSize: 20),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                value,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: getResponsiveFontSize(context, fontSize: 20),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
