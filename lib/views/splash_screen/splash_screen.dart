import 'package:bookstore/cache/cache_helper.dart';
import 'package:bookstore/constants.dart';
import 'package:bookstore/core/services/service_locator.dart';
import 'package:bookstore/helper/local_network.dart';
import 'package:bookstore/views/onboarding_screens/onboarding.dart';
import 'package:bookstore/views/signin-up/sign_in_view.dart';
import 'package:bookstore/views/user_nav_bar_m.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    bool isOnBoardingVisited =
        getIt<CacheHelper>().getData(key: 'isOnBoardingVisited') ?? false;

    Future.delayed(
        const Duration(
          seconds: 2,
        ), () {
      if (isOnBoardingVisited == true) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CacheNetwork.getCacheData(key: 'token') != ""
                ? const UserNavigationBar()
                : const Signin(),
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const OnboardingScreen(),
          ),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Image.asset('assets/images/logo.png',
                    width: 200, height: 200)),
            const SizedBox(height: 15),
            Text(
              'E-BookStore',
              style: TextStyle(
                  fontSize: getResponsiveFontSize(context, fontSize: 40),
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Poppins'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            const CircularProgressIndicator(
              color: Colors.black,
            )
          ]),
    );
  }
}
