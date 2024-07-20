import 'package:bookstore/cubits/bottom_navigation_bar/bottom_navigation_bar_cubit.dart';
import 'package:bookstore/cubits/get_user_info/get_user_info_cubit.dart';
import 'package:bookstore/generated/l10n.dart';
import 'package:bookstore/helper/local_network.dart';
import 'package:bookstore/views/cart.dart';
import 'package:bookstore/views/categories_view.dart';
import 'package:bookstore/views/chat_view.dart';
import 'package:bookstore/views/home_view.dart';
import 'package:bookstore/views/search_screen.dart';
import 'package:bookstore/views/settings_view.dart';
import 'package:bookstore/views/signin-up/sign_in_view.dart';
import 'package:bookstore/widgets/user_favourite_book.dart';
import 'package:bookstore/widgets/user_owns_books.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserNavigationBar extends StatelessWidget {
  const UserNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.black12,
              ),
              child: Image.asset(
                'assets/images/logo.png',
                height: 120,
                width: 120,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.book, color: Colors.black),
              title: Text(S.of(context).yourbooks),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserBooks(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite, color: Colors.black),
              title: Text(S.of(context).Favorites),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserFavouriteBooks(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(S.of(context).Settings),
              leading: const Icon(Icons.settings, color: Colors.black),
              onTap: () {
                context.read<GetUserInfoCubit>().getUserInfo();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsView(),
                  ),
                );
              },
            ),
            ListTile(
                title: Text(S.of(context).Logout),
                leading: const Icon(Icons.logout, color: Colors.black),
                onTap: () {
                  CacheNetwork.deleteCacheItem(key: 'token');
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Signin()),
                  );
                }),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: bottomNavigationKey,
        animationDuration: const Duration(milliseconds: 600),
        backgroundColor: Colors.white,
        color: Colors.black,
        items: const [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.search,
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
        ],
        onTap: (index) {
          if (index == 0) {
            context.read<BottomNavigationBarCubit>().homeNavigation();
          } else if (index == 1) {
            context.read<BottomNavigationBarCubit>().searcgNavigation();
          } else if (index == 2) {
            context.read<BottomNavigationBarCubit>().categoryNavigation();
          } else if (index == 3) {
            context.read<BottomNavigationBarCubit>().chatNavigation();
          } else if (index == 4) {
            context.read<BottomNavigationBarCubit>().cartNavigation();
          }
        },
      ),
      body: BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
        builder: (context, state) {
          if (state is BottomNavigationBarInitial ||
              state is BottomNavigationBarHome) {
            if (kDebugMode) {
              print(' token : ${CacheNetwork.getCacheData(key: 'token')}');
            }
            return const HomeView();
          } else if (state is BottomNavigationBarCategory) {
            return const CategoriesView();
          } else if (state is BottomNavigationBarChat) {
            return const ChatView();
          } else if (state is BottomNavigationBarSearch) {
            return const SearchScreen();
          } else {
            return const Cart();
          }
        },
      ),
    );
  }
}
