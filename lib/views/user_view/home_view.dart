import 'package:bookstore/widgets/best_deals_section.dart';
import 'package:bookstore/widgets/book_card_list_view.dart';
import 'package:bookstore/widgets/headers_of_books_section.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              BestDealsSection(),
              SizedBox(
                height: 56,
              ),
              HeadersOfBooksSection(title: 'Top Books'),
              BookCardListView(),
              SizedBox(
                height: 56,
              ),
              HeadersOfBooksSection(title: 'Latest Books'),
              BookCardListView(),
              SizedBox(
                height: 56,
              ),
              HeadersOfBooksSection(title: 'Upcoming Books'),
              BookCardListView()
            ],
          ),
        ),
      ),
    );
  }
}
