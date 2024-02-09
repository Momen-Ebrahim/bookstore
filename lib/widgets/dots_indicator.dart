import 'package:bookstore/widgets/custom_dot_indicator.dart';
import 'package:flutter/material.dart';

class DotsIndicator extends StatelessWidget {
  const DotsIndicator(
      {super.key, required this.length, required this.currentPageIndex});
  final int length, currentPageIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (index) => Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: CustomDotIndicator(
              isActive: index == currentPageIndex ? true : false),
        ),
      ),
    );
  }
}
