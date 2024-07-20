import 'package:bookstore/loading_card.dart';
import 'package:flutter/material.dart';

class CustomLoadingSmallCard extends StatelessWidget {
  const CustomLoadingSmallCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          loadingSmallCard(),
          loadingSmallCard(),
          loadingSmallCard(),
        ],
      ),
    );
  }
}
