import 'package:flutter/material.dart';

class FilterIcon extends StatelessWidget {
  const FilterIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.14,
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          color: const Color(0xFFD9D9D9)),
      child: const Icon(Icons.filter_alt),
    );
  }
}
