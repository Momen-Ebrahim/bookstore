import 'package:bookstore/constants.dart';
import 'package:bookstore/widgets/category_grid_view.dart';
import 'package:flutter/material.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});
  static const categoryItems = [
    'Fiction',
    'Non-fiction',
    'Fantasy',
    'History',
    'Classics',
    'Mystery',
    'Crime',
    'Horror',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Categories',
              style: TextStyle(
                  fontSize: getResponsiveFontSize(context, fontSize: 32),
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF252525)),
            ),
            const SizedBox(
              height: 36,
            ),
            const CategoryGridView(categoryItems: categoryItems),
          ],
        ),
      ),
    );
  }
}
