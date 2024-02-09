import 'package:bookstore/widgets/category_card.dart';
import 'package:flutter/material.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({
    super.key,
    required this.categoryItems,
  });

  final List<String> categoryItems;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: categoryItems.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 30,
          crossAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          return SizedBox(
            child: CategoryCard(
              title: categoryItems[index],
            ),
          );
        },
      ),
    );
  }
}
