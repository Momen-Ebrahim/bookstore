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
    // return ListView.builder(
    //   shrinkWrap: true,
    //   scrollDirection: Axis.horizontal,
    //   itemCount: bookCardImage.length,
    //   itemBuilder: ((context, index) {
    //     return BookCardd(
    //       image: bookCardImage[index],
    //     );
    //   }),
    // );
    return Row(
      children: bookCardImage
          .map((e) => const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: BookCardd(
                    image: 'assets/images/topBooks2.png',
                  ),
                ),
              ))
          .toList(),
    );
  }
}
