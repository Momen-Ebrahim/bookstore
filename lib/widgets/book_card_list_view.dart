import 'package:bookstore/models/book_card_models.dart';
import 'package:bookstore/widgets/book_card.dart';
import 'package:flutter/material.dart';

class BookCardListView extends StatelessWidget {
  const BookCardListView({super.key});
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
    return Container(
      height: MediaQuery.of(context).size.height * 0.46,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: bookCardItems.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: BookCard(
              bookCardModels: bookCardItems[index],
            ),
          );
        }),
      ),
    );
    // return Row(
    //   children: bookCardImage
    //       .map((e) => const Expanded(
    //             child: Padding(
    //               padding: EdgeInsets.only(left: 12),
    //               child: BookCardd(
    //                 image: 'assets/images/topBooks2.png',
    //               ),
    //             ),
    //           ))
    //       .toList(),
    // );
  }
}
