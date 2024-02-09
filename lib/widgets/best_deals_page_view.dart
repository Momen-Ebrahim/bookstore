import 'package:bookstore/widgets/my_card.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';

class BestDealsPageView extends StatelessWidget {
  const BestDealsPageView({super.key, required this.pageController});
  final PageController pageController;
  static const bestDeals = [
    'assets/images/bestDeals.png',
    'assets/images/bestDeals1.png',
  ];
  @override
  Widget build(BuildContext context) {
    return ExpandablePageView(
      scrollDirection: Axis.horizontal,
      controller: pageController,
      children: List.generate(
        bestDeals.length,
        (index) =>
            MyCard(image: bestDeals[index], listLength: bestDeals.length),
      ),
    );
  }
}
