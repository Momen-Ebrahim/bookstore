import 'package:bookstore/widgets/best_deals_section.dart';
import 'package:bookstore/widgets/headers_and_books_section.dart';
import 'package:bookstore/widgets/top_bar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: topBar(
          'Happy Reading!',
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(
                //   height: 36,
                // ),
                SizedBox(
                  height: 56,
                ),
                BestDealsSection(),
                SizedBox(
                  height: 56,
                ),
                HeadersAndBooksSection(title: 'Top Books'),
                SizedBox(
                  height: 56,
                ),
                HeadersAndBooksSection(title: 'Latest Books'),
                SizedBox(
                  height: 56,
                ),
                HeadersAndBooksSection(title: 'Upcoming Books'),
              ],
            ),
          ),
        ));
  }
}
