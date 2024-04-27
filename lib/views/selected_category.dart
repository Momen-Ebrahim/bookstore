import 'package:bookstore/widgets/book_card_of_category_list_view.dart';
import 'package:bookstore/widgets/top_bar.dart';
import 'package:flutter/material.dart';

class SelectedCategory extends StatelessWidget {
  const SelectedCategory({super.key, required this.categoryName});
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          topBar(
            categoryName,
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
          BookCardOfCategoryListView(
            categoryName: categoryName,
          ),
        ],
      ),
    ));
  }
}
