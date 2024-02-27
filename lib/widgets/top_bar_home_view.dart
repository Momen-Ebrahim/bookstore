import 'package:flutter/material.dart';

class TopBarHomeView extends StatelessWidget {
  const TopBarHomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          'Happy Reading!',
          style: TextStyle(
              color: Color(0xFF111111),
              fontSize: 24,
              fontWeight: FontWeight.w600),
        ),
        Spacer(),
        Icon(
          Icons.search,
          size: 36,
          color: Color(0xFF111111),
        ),
      ],
    );
  }
}
