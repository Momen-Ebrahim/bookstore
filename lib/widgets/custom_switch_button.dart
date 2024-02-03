import 'package:flutter/material.dart';

class CustomSwitchButton extends StatelessWidget {
  const CustomSwitchButton(
      {super.key, required this.color, required this.title, this.onTap});
  final Color color;
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 100,
        decoration: BoxDecoration(
          color: color,
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
