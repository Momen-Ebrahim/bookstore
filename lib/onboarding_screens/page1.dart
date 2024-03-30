import 'package:bookstore/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .6,
              child: Center(
                child: SvgPicture.asset(
                  'assets/images/svg/onboarding1.svg',
                  width: 400,
                  height: 400,
                ),
              ),
            ),
            Text(
              "Reading Offline",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: getResponsiveFontSize(context, fontSize: 30)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                "Reading books at anytime anywhere, save your time and data!",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: getResponsiveFontSize(context, fontSize: 18),
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
