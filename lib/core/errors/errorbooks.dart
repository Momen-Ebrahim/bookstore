import 'package:bookstore/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BooksError extends StatelessWidget {
  const BooksError({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          SvgPicture.asset(
            'assets/images/svg/bookerror.svg',
            height: 300,
            width: 300,
          ),
          Text(
            'Failed to load books',
            style: TextStyle(
                color: Colors.black,
                fontSize: getResponsiveFontSize(context, fontSize: 30),
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
