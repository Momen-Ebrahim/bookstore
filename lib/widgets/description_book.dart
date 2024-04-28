import 'package:bookstore/constants.dart';
import 'package:flutter/material.dart';

class DescriptionBook extends StatelessWidget {
  const DescriptionBook({super.key, required this.description});
        final String description;
         


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Description:',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: getResponsiveFontSize(context, fontSize: 18),
            ),
          ),
        ),
        const Divider(
          height: 20,
        ),
        Text(
          description,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: getResponsiveFontSize(context, fontSize: 18),
          ),
        ),
      ],
    );
  }
}
