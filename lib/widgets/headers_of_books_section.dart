import 'package:bookstore/constants.dart';
import 'package:flutter/material.dart';

class HeadersOfBooksSection extends StatelessWidget {
  const HeadersOfBooksSection({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: getResponsiveFontSize(context, fontSize: 28),
                color: const Color(0xFF121212),
              ),
            ),
            const Spacer(),
            Text(
              'see more',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: getResponsiveFontSize(context, fontSize: 20),
                color: const Color(0xFF121212),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 35,
        ),
      ],
    );
  }
}
