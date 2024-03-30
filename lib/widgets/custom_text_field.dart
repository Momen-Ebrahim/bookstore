import 'package:bookstore/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
          size: 32,
        ),
        hintText: 'Search title/author/ISBN no',
        hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: getResponsiveFontSize(context, fontSize: 18),
            color: const Color(0xFF252525)),
        fillColor: const Color(0xFFDEDEDE),
        filled: true,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Color(0xFFFAFAFA),
      ),
    );
  }
}
