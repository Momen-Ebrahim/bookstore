import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/images/svgviewer-png-output.png',
              height: height * 0.6,
              width: width,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: height * 0.45,
            left: width * 0.5 - 68,
            child: Image.asset(
              'assets/images/logo.png',
              width: 137,
              height: 137,
            ),
          ),
        ],
      ),
    );
  }
}
