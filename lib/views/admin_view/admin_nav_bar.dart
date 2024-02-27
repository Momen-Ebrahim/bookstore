import 'package:bookstore/cubits/bottom_navigation_bar/bottom_navigation_bar_cubit.dart';
import 'package:bookstore/signin-up/sign_in.dart';
import 'package:bookstore/views/admin_view/AddBook.dart';
import 'package:bookstore/views/admin_view/categories_view.dart';
import 'package:bookstore/views/admin_view/home_view.dart';
import 'package:bookstore/views/user_view/chat_view.dart';
import 'package:bookstore/views/user_view/settings_view.dart';
import 'package:bookstore/widgets/user_favourite_book.dart';
import 'package:bookstore/widgets/user_owns_books.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AdminNavigationBar extends StatelessWidget {
  const AdminNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;

    void logout() {
      if (FirebaseAuth.instance.currentUser != null) {
        auth.signOut();
        if (kDebugMode) {
          print('Sign Out account');
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Signin(),
          ),
        );
      }

      if (GoogleSignIn().currentUser != null) {
        GoogleSignIn().signOut();
        if (kDebugMode) {
          print('Sign Out google account');
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Signin(),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.black))
        ],
      ),
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
              title: const Text('Your books'),
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
              title: const Text('Favorites'),
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
              title: const Text('Settings'),
              leading: const Icon(Icons.settings, color: Colors.black),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const SettingsView(),
                //   ),
                // );
              },
            ),
            ListTile(
                title: const Text('Log out'),
                leading: const Icon(Icons.logout, color: Colors.black),
                onTap: () {
                  logout();
                }),
          ],
        ),
      ),
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
            FontAwesomeIcons.addressBook,
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
            return const AdminHomeView();
          } else if (state is BottomNavigationBarCategory) {
            return const AdminCategoriesView();
          } else if (state is BottomNavigationBarChat) {
            return const ChatView();
          } else if (state is BottomNavigationBarCart) {
            return const AddBook();
          } else {
            return const SettingsView();
          }
        },
      ),
    );
  }
}