import 'dart:convert';

import 'package:bookstore/constants.dart';
import 'package:bookstore/widgets/card_of_cart_user_books.dart';
import 'package:bookstore/widgets/open_book.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserBooks extends StatefulWidget {
  const UserBooks({super.key});

  @override
  State<UserBooks> createState() => _UserBooksState();
}

class _UserBooksState extends State<UserBooks> {
  List<dynamic> books = [];

  Future<void> fetchBooks() async {
    final response =
        await http.get(Uri.parse('https://book-store-api-mu.vercel.app/Books'));
    if (response.statusCode == 200) {
      setState(() {
        books = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load books');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchBooks();
  }

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
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: books.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: CardOfUserBooks(
                              image: books[index]['image']['url'],
                              title: books[index]['title'],
                              price: books[index]['price'],
                              author: books[index]['author'],
                              type: books[index]['category'],
                              ontap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          OpenBook(
                                        image: books[index]['pdf']['url'],
                                      ),
                                    ));
                              }),
                        ),
                      );
                    }),
                  ),
                )
                // CardOfUserBooks(
                //   image: 'assets/images/bestDeals.png',
                //   type: 'Adult Narrative',
                //   title: 'Hello, Dream',
                //   author: 'Cristina Camerena, Lady Desatia',
                //   price: '\$17.00',
                //   ontap: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute<void>(
                //           builder: (BuildContext context) => const OpenBook(
                //             image:
                //                 'https://res.cloudinary.com/ddtp8tqvv/image/upload/v1713387512/Books/pkcyi4gcuzderpfel70g.pdf',
                //           ),
                //         ));
                //   },
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                // CardOfUserBooks(
                //   image: 'assets/images/topBooks2.png',
                //   title: 'Tuesday Mooney Talks to Ghosts',
                //   author: 'Kate Racculia',
                //   price: '\$25.00',
                //   type: 'Novel',
                //   ontap: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute<void>(
                //           builder: (BuildContext context) => const OpenBook(
                //             image: 'assets/books/book4.pdf',
                //           ),
                //         ));
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
