import 'package:bookstore/constants.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 36,
          ),
          const Row(
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
          const SizedBox(
            height: 36,
          ),
          Text(
            'Categories',
            style: TextStyle(
                fontSize: getResponsiveFontSize(context, fontSize: 28),
                fontWeight: FontWeight.w600,
                color: const Color(0xFF252525)),
          ),
          const SizedBox(
            height: 36,
          ),
          const CategoryGridView(categoryItems: categoryItems),
        ],
      ),
    );
  }
}
