import 'package:bookstore/loading_card.dart';
import 'package:flutter/material.dart';

class CustomLoadingSmallCardGridView extends StatelessWidget {
  const CustomLoadingSmallCardGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
            padding: const EdgeInsets.all(10.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: .5,
            ),
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: loadingSmallCard(),
              );
            }));
  }
}
