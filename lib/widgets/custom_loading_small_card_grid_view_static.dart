import 'package:bookstore/loading_card.dart';
import 'package:flutter/material.dart';

class CustomLoadingSmallCardGridViewStatic extends StatelessWidget {
  const CustomLoadingSmallCardGridViewStatic({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: GridView(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: .5,
        ),
        children: [
          loadingSmallCard(),
          loadingSmallCard(),
          loadingSmallCard(),
          loadingSmallCard(),
          loadingSmallCard(),
          loadingSmallCard(),
        ],
      ),
    );
  }
}
