import 'package:bookstore/constants.dart';
import 'package:bookstore/widgets/best_deals_page_view.dart';
import 'package:bookstore/widgets/dots_indicator.dart';
import 'package:flutter/material.dart';

class BestDealsSection extends StatefulWidget {
  const BestDealsSection({super.key});

  @override
  State<BestDealsSection> createState() => _BestDealsSectionState();
}

class _BestDealsSectionState extends State<BestDealsSection> {
  int currentPageIndex = 0;
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPageIndex = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Best Deals',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: getResponsiveFontSize(context, fontSize: 32),
            color: const Color(0xFF111111),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        BestDealsPageView(
          pageController: pageController,
        ),
        const SizedBox(
          height: 20,
        ),
        DotsIndicator(length: 2, currentPageIndex: currentPageIndex),
      ],
    );
  }
}
