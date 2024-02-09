import 'package:flutter/material.dart';

class CustomDotIndicator extends StatelessWidget {
  const CustomDotIndicator({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 10,
      height: 10,
      duration: const Duration(milliseconds: 300),
      decoration: ShapeDecoration(
        color: isActive ? const Color(0xFF35247B) : const Color(0xFFBBBBBB),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
