import 'package:bookstore/loading_card.dart';
import 'package:flutter/material.dart';

class CustomLoadingBigCard extends StatelessWidget {
  const CustomLoadingBigCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          loadingBigCard(),
          loadingBigCard(),
          loadingBigCard(),
        ],
      ),
    );
  }
}
