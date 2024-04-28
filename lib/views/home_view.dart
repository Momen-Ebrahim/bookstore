import 'package:bookstore/widgets/all_books_view.dart';
import 'package:bookstore/widgets/best_deals_section.dart';
import 'package:bookstore/widgets/TopBooks_Card_ListView.dart';
import 'package:bookstore/widgets/lastedbooks.dart';
import 'package:bookstore/widgets/uncomingbooks.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: topBar(
      //     'Happy Reading!',
      //     GestureDetector(
      //       onTap: () => Navigator.push(
      //         context,
      //         MaterialPageRoute<void>(
      //           builder: (BuildContext context) => const SearchView(),
      //         ),
      //       ),
      //       child: const Icon(
      //         Icons.search,
      //         size: 30,
      //       ),
      //     )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 56,
              ),
              BestDealsSection(),
              SizedBox(
                height: 56,
              ),
              TopBookCardListView(),
              SizedBox(
                height: 56,
              ),
              BooknewarrivalCardListView(),
              SizedBox(
                height: 56,
              ),
              AllBooksView(),
              SizedBox(
                height: 56,
              ),
              BookuncomingCardListView()
            ],
          ),
        ),
      ),
    );
  }
}
