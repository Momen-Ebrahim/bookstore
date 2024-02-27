import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .6,
            child: Center(
              child: SvgPicture.asset(
                'assets/images/svg/onboarding2.svg',
                width: 400,
                height: 400,
              ),
            ),
          ),
          const Text(
            "Search & Purchase",
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .05,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              "Find the perfect book for and discover new ones that interest you",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ]),
      ),
    );
  }
}
