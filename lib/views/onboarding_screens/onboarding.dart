import 'package:bookstore/cache/cache_helper.dart';
import 'package:bookstore/constants.dart';
import 'package:bookstore/core/services/service_locator.dart';
import 'package:bookstore/generated/l10n.dart';
import 'package:bookstore/views/onboarding_screens/page1.dart';
import 'package:bookstore/views/onboarding_screens/page2.dart';
import 'package:bookstore/views/onboarding_screens/page3.dart';
import 'package:bookstore/views/signin-up/sign_in_view.dart';
import 'package:bookstore/views/signin-up/sign_up_view.dart';
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
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Text(
                            S.of(context).readmorethan,
                            style: TextStyle(
                              fontSize:
                                  getResponsiveFontSize(context, fontSize: 16),
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
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
                            title: S.of(context).GetStarted,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      const Signin(),
                                ),
                              );
                              // final pref =
                              //           await SharedPreferences.getInstance();
                              //       pref.setBool('showhome', true);
                            },
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => const SignUp(),
                              ),
                            );
                            // // final pref =
                            // //     await SharedPreferences.getInstance();
                            // // pref.setBool('showhome', true);
                          },
                          child: Text(
                            S.of(context).Register,
                            style: TextStyle(
                                fontSize: getResponsiveFontSize(context,
                                    fontSize: 16),
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        child: Text(
                          S.of(context).skip,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize:
                                getResponsiveFontSize(context, fontSize: 18),
                          ),
                        ),
                        onTap: () {
                          getIt<CacheHelper>().saveData(
                              key: "isOnBoardingVisited", value: true);
                          _pageController.jumpToPage(2);
                        },
                      ),
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
                        child: Text(S.of(context).Next,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: getResponsiveFontSize(context,
                                    fontSize: 18))),
                        onTap: () {
                          getIt<CacheHelper>().saveData(
                              key: "isOnBoardingVisited", value: true);
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
