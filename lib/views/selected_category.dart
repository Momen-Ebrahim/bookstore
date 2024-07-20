import 'package:bookstore/widgets/book_card_of_category_grid_view.dart';
import 'package:bookstore/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SelectedCategory extends StatelessWidget {
  const SelectedCategory(
      {super.key,
      required this.categoryName,
      required this.getLocalizedCategoryItems});
  final String categoryName;
  final String getLocalizedCategoryItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        topBar(
          getLocalizedCategoryItems,
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        BookCardOfCategoryGridView(
          categoryName: categoryName,
        ),
      ],
    ));
  }
}
