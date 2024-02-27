import 'package:bookstore/onboarding_screens/page1.dart';
import 'package:bookstore/onboarding_screens/page2.dart';
import 'package:bookstore/onboarding_screens/page3.dart';
import 'package:bookstore/signin-up/sign_in.dart';
import 'package:bookstore/signin-up/sign_up_view.dart';
import 'package:bookstore/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  Widget content = Container();
  var _currentPage = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(children: [
        PageView(
            onPageChanged: (index) {
              setState(() {
                _currentPage = index == 2;
              });
            },
            controller: _pageController,
            children: const [
              Page1(),
              Page2(),
              Page3(),
            ]),
        Container(
            alignment: const Alignment(0, 0.9),
            child: _currentPage
                ? Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 30,
                              right: 30,
                            ),
                            child: Text(
                              'Read more and stress less with our online book shopping app. Shop from anywhere you are and discover titles that you love. Happy reading!',
                              style: TextStyle(
<<<<<<< HEAD
                                fontSize: 16,
=======
                                fontSize: 18,
>>>>>>> 47f1769b8636468b250d00101c381a77bc1e1e29
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * (50 / 800),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: CustomButton(
                              color: Colors.black,
                              title: "Sign Up",
                              onTap: () {
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                  builder: (ctx) => const SignUpView(),
                                ));
                                // final pref =
                                //           await SharedPreferences.getInstance();
                                //       pref.setBool('showhome', true);
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "You have account?",
                                style: TextStyle(
<<<<<<< HEAD
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                ),
=======
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16),
>>>>>>> 47f1769b8636468b250d00101c381a77bc1e1e29
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (ctx) => const Signin()));
                                    // // final pref =
                                    // //     await SharedPreferences.getInstance();
                                    // // pref.setBool('showhome', true);
                                  },
                                  child: const Text("Sign in",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)))
                            ],
                          )
                        ]),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                          child: const Text("skip",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18)),
                          onTap: () {
                            _pageController.jumpToPage(2);
                          }),
                      SmoothPageIndicator(
                          controller: _pageController,
                          count: 3,
                          effect: const ExpandingDotsEffect(
                            dotColor: Colors.grey,
                            activeDotColor: Colors.black,
                            dotHeight: 10,
                            dotWidth: 10,
                            spacing: 5,
                            expansionFactor: 4,
                          )),
                      GestureDetector(
                        child: const Text("next",
                            style:
                                TextStyle(color: Colors.black, fontSize: 18)),
                        onTap: () {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        },
                      )
                    ],
                  ))
      ]),
    );
  }
}
