import 'package:bookstore/constants.dart';
import 'package:bookstore/widgets/card_of_cart_user_books.dart';
import 'package:bookstore/widgets/open_book.dart';
import 'package:flutter/material.dart';

class UserBooks extends StatefulWidget {
  const UserBooks({super.key});

  @override
  State<UserBooks> createState() => _UserBooksState();
}

class _UserBooksState extends State<UserBooks> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Your Books',
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
                          builder: (BuildContext context) => const OpenBook(
                            image: 'assets/books/book3.pdf',
                          ),
                        ));
                  },
                ),
                const SizedBox(
                  height: 20,
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
                          builder: (BuildContext context) => const OpenBook(
                            image: 'assets/books/book4.pdf',
                          ),
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
