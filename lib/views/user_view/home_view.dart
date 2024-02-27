import 'package:bookstore/widgets/best_deals_section.dart';
import 'package:bookstore/widgets/book_card_list_view.dart';
import 'package:bookstore/widgets/headers_of_books_section.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD:lib/views/user_view/home_view.dart
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
=======
    return Scaffold(
        appBar: topBar(
          'Happy Reading!',
>>>>>>> 47f1769b8636468b250d00101c381a77bc1e1e29:lib/views/home_view.dart
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
