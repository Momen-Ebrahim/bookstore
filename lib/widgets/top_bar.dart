import 'package:flutter/material.dart';

AppBar topBar(final String title, Widget? widget) {
  return AppBar(
    leading: widget,
    automaticallyImplyLeading: false,
    centerTitle: true,
    title: Text(
      title,
      style: const TextStyle(
        color: Color(0xFF111111),
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
