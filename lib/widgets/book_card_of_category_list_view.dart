import 'package:bookstore/models/book_card_models.dart';
import 'package:bookstore/widgets/book_card_of_category.dart';
import 'package:flutter/material.dart';

class BookCardOfCategoryListView extends StatelessWidget {
  const BookCardOfCategoryListView({super.key});
  static const bookCardItems = [
    BookCardModels('assets/images/topBooks1.png',
        category: 'classics',
        title: 'The Picture of Dorian\n Gray',
        autherName: 'Oscar Wilde',
        price: r'$25.00'),
    BookCardModels('assets/images/topBooks2.png',
        category: 'classics',
        title: 'The Picture of Dorian\n Gray',
        autherName: 'Oscar Wilde',
        price: r'$25.00'),
    BookCardModels('assets/images/bestDeals.png',
        category: 'classics',
        title: 'The Picture of Dorian\n Gray',
        autherName: 'Oscar Wilde',
        price: r'$25.00'),
    BookCardModels('assets/images/bestDeals1.png',
        category: 'classics',
        title: 'The Picture of Dorian\n Gray',
        autherName: 'Oscar Wilde',
        price: r'$25.00'),

    // '',
    // ',
    // // 'assets/images/bestDeals1.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: bookCardItems.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: BookCardOfSelectedCategory(
              bookCardModels: bookCardItems[index],
            ),
          );
        }),
      ),
    );
  }
}
