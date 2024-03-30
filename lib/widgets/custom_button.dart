import 'package:bookstore/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.color,
      required this.title,
      this.onTap,
      this.isSeloading = false});
  final Color color;
  final String title;
  final Function()? onTap;
  final bool isSeloading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: isSeloading
            ? const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: getResponsiveFontSize(context, fontSize: 24),
                    color: Colors.white,
                  ),
                ),
              ),
      ),
    );
  }
}
