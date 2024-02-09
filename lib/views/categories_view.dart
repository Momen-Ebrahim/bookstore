import 'package:bookstore/widgets/category_grid_view.dart';
import 'package:bookstore/widgets/custom_text_field.dart';
import 'package:bookstore/widgets/filter_icon.dart';
import 'package:flutter/material.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});
  static const categoryItems = [
    'Non-fiction',
    'Classics',
    'Fantasy',
    'Young Adult',
    'Crime',
    'Horror',
    'Sci-fi',
    'Drama',
  ];
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 36,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(),
                ),
                SizedBox(
                  width: 10,
                ),
                FilterIcon(),
              ],
            ),
            SizedBox(
              height: 36,
            ),
            Text(
              'Categories',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF252525)),
            ),
            SizedBox(
              height: 36,
            ),
            CategoryGridView(categoryItems: categoryItems),
          ],
        ),
      ),
    );
  }
}
