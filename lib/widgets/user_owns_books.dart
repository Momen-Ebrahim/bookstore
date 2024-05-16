import 'dart:convert';

import 'package:bookstore/constants.dart';
import 'package:bookstore/cubits/get_books/get_user_own__books/get_books_cubit.dart';
import 'package:bookstore/widgets/card_of_cart_user_books.dart';
import 'package:bookstore/widgets/open_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    context.read<GetownBooksCubit>().getownBooks();
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
          child: BlocBuilder<GetownBooksCubit, GetownBooksState>(
              builder: (context, state) {
            if (state is GetownBooksLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            } else if (state is GetownBooksSuccess) {
              if (state.books.books!.isEmpty) {
                return Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      Image.asset(
                        'assets/images/emptyownbooks.png',
                        height: 300,
                        width: 300,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Buy some books',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize:
                                getResponsiveFontSize(context, fontSize: 30),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              } else {
                return BlocBuilder<GetownBooksCubit, GetownBooksState>(
                  builder: (context, state) {
                    if (state is GetownBooksLoading) {
                      return const Center(
                          child: CircularProgressIndicator(
                        color: Colors.black,
                      ));
                    } else if (state is GetownBooksSuccess) {
                      return ListView.builder(
                        itemCount: state.books.books!.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                right: 12, left: 12, bottom: 12.0),
                            child: CardOfUserBooks(
                              image: state.books.books![index].image!.url
                                  .toString(),
                              title: state.books.books![index].title!,
                              price: state.books.books![index].price.toString(),
                              ontap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          OpenBook(
                                        bookurl: state
                                            .books.books![index].pdf!.url
                                            .toString(),
                                      ),
                                    ));
                              },
                              author: state.books.books![index].author!,
                              type: state.books.books![index].category!,
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(child: Text('No Books found'));
                    }
                  },
                );
              }
            } else if (state is GetownBooksFailure) {
              return const Center(
                child: Text('Failed to load own books'),
              );
            }
            return const SizedBox(
              child: Text('Failed to load own books'),
            );
          }),
        ),
      ),
    );
  }
}
