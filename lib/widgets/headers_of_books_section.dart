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
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 28,
                color: Color(0xFF121212),
              ),
            ),
            const Spacer(),
            const Text(
              'see more',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: Color(0xFF121212),
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
