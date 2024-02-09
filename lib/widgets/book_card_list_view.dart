import 'package:bookstore/widgets/book_card.dart';
import 'package:flutter/material.dart';

class BookCardListView extends StatelessWidget {
  const BookCardListView({super.key});
  static const bookCardImage = [
    'assets/images/topBooks1.png',
    'assets/images/topBooks2.png',
    // 'assets/images/bestDeals1.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: bookCardImage
          .map((e) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: BookCard(image: e),
                ),
              ))
          .toList(),
    );
  }
}
