import 'package:bookstore/cubits/bottom_navigation_bar/bottom_navigation_bar_cubit.dart';
import 'package:bookstore/views/Cart.dart';
import 'package:bookstore/views/categories_view.dart';
import 'package:bookstore/views/chat_view.dart';
import 'package:bookstore/views/home_view.dart';
import 'package:bookstore/views/settings_view.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserNavigationBar extends StatelessWidget {
  const UserNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: const Duration(milliseconds: 600),
        backgroundColor: Colors.white,
        color: Colors.black,
        items: const [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.category,
            color: Colors.white,
          ),
          Icon(
            Icons.chat,
            color: Colors.white,
          ),
          Icon(
            FontAwesomeIcons.cartShopping,
            color: Colors.white,
          ),
          Icon(
            Icons.settings,
            color: Colors.white,
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            context.read<BottomNavigationBarCubit>().homeNavigation();
          } else if (index == 1) {
            context.read<BottomNavigationBarCubit>().categoryNavigation();
          } else if (index == 2) {
            context.read<BottomNavigationBarCubit>().chatNavigation();
          } else if (index == 3) {
            context.read<BottomNavigationBarCubit>().cartNavigation();
          } else {
            context.read<BottomNavigationBarCubit>().settingsNavigation();
          }
        },
      ),
      body: BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
        builder: (context, state) {
          if (state is BottomNavigationBarInitial ||
              state is BottomNavigationBarHome) {
            return const HomeView();
          } else if (state is BottomNavigationBarCategory) {
            return const CategoriesView();
          } else if (state is BottomNavigationBarChat) {
            return const ChatView();
          } else if (state is BottomNavigationBarCart) {
            return const Cart();
          } else {
            return const SettingsView();
          }
        },
      ),
    );
  }
}
