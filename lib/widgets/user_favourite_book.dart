import 'package:bookstore/constants.dart';
import 'package:bookstore/views/selected_book_view.dart';
import 'package:bookstore/widgets/card_of_cart_user_books.dart';
import 'package:flutter/material.dart';

class UserFavouriteBooks extends StatefulWidget {
  const UserFavouriteBooks({super.key});

  @override
  State<UserFavouriteBooks> createState() => _UserFavouriteBooksState();
}

class _UserFavouriteBooksState extends State<UserFavouriteBooks> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Favourite Books',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: getResponsiveFontSize(context, fontSize: 24),
                  fontWeight: FontWeight.w600)),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CardOfUserBooks(
                  image: 'assets/images/bestDeals.png',
                  type: 'Adult Narrative',
                  title: 'Hello, Dream',
                  author: 'Cristina Camerena, Lady Desatia',
                  price: '\$17.00',
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const SelectedBookView(),
                        ));
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CardOfUserBooks(
                  image: 'assets/images/topBooks2.png',
                  title: 'Tuesday Mooney Talks to Ghosts',
                  author: 'Kate Racculia',
                  price: '\$25.00',
                  type: 'Novel',
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const SelectedBookView(),
                        ));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
