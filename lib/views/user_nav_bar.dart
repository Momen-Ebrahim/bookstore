import 'package:bookstore/signin-up/sign_in.dart';
import 'package:bookstore/views/Cart.dart';
import 'package:bookstore/views/account.dart';
import 'package:bookstore/views/categories_view.dart';
import 'package:bookstore/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class UserNavBar extends StatefulWidget {
  const UserNavBar({super.key});

  @override
  State<UserNavBar> createState() => _UserNavBarState();
}

class _UserNavBarState extends State<UserNavBar> {
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,

      screens: [
        HomeView(),
        CategoriesView(),
        Cart(),
        Account(
          onSignOut: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Signin()),
            );
          },
        )
      ],
      items: [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          title: ("Home"),
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.category),
          title: ("Categories"),
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.shopping_cart),
          title: ("Cart"),
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.person_pin_sharp),
          title: ("Account"),
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.grey,
        ),
      ],
      confineInSafeArea: true,
      navBarHeight:
          MediaQuery.of(context).size.height * (70 / 800), // Default is 50.0s
      backgroundColor: Colors.black,
      handleAndroidBackButtonPress: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,

      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style6,
    );
  }
}
