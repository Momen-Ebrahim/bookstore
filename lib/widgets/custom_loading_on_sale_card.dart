import 'package:bookstore/loading_card.dart';
import 'package:flutter/material.dart';

class CustomLoadingOnSaleCard extends StatelessWidget {
  const CustomLoadingOnSaleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          loadingOnSaleCard(),
          loadingOnSaleCard(),
          loadingOnSaleCard(),
        ],
      ),
    );
  }
}
