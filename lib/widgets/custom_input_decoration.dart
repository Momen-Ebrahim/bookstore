import 'package:flutter/material.dart';

InputDecoration inputdec(String hintText) {
  return InputDecoration(
    hintText: hintText,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        color: Color(0xff2F3C50),
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        color: Color(0xff2F3C50),
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        color: Color(0xff2F3C50),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        color: Colors.black,
      ),
    ),
  );
}
