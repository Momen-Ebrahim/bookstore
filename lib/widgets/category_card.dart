import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.13,
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          colors: [Colors.black, Colors.black],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        image: const DecorationImage(
          fit: BoxFit.fill,
          opacity: 0.5,
          image: AssetImage(
            'assets/images/categoryCover.png',
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
            color: Color(0xFFF2F2F2),
          ),
        ),
      ),
    );
  }
}
