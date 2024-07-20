import 'package:bookstore/constants.dart';
import 'package:bookstore/generated/l10n.dart';
import 'package:bookstore/widgets/category_grid_view.dart';
import 'package:flutter/material.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  static List<String> getLocalizedCategoryItems(BuildContext context) {
    return [
      S.of(context).Fiction,
      S.of(context).NonFiction,
      S.of(context).Fantasy,
      S.of(context).History,
      S.of(context).Classics,
      S.of(context).Mystery,
      S.of(context).Crime,
      S.of(context).Horror,
    ];
  }

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
    final localizedCategoryItems = getLocalizedCategoryItems(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).Categories,
              style: TextStyle(
                fontSize: getResponsiveFontSize(context, fontSize: 32),
                fontWeight: FontWeight.w600,
                color: const Color(0xFF252525),
              ),
            ),
            const SizedBox(
              height: 36,
            ),
            CategoryGridView(
              categoryItems: categoryItems,
              getLocalizedCategoryItems: localizedCategoryItems,
            ),
          ],
        ),
      ),
    );
  }
}
