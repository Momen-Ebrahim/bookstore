import 'package:bookstore/constants.dart';
import 'package:bookstore/models/book_card_models.dart';
import 'package:bookstore/widgets/add_comment_for_rating.dart';
import 'package:bookstore/widgets/description_book.dart';
import 'package:bookstore/widgets/selected_book_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SelectedBookView extends StatelessWidget {
  const SelectedBookView({super.key});

  @override
  Widget build(BuildContext context) {
    final BookCardModels bookCardModels =
        ModalRoute.of(context)!.settings.arguments as BookCardModels;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 32,
          ),
        ),
        title: Text(
          bookCardModels.category,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: getResponsiveFontSize(context, fontSize: 24),
              color: const Color(0xFF121212)),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: IconButton(
              icon: const Icon(
                FontAwesomeIcons.heart,
                size: 24,
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  bookCardModels.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: getResponsiveFontSize(context, fontSize: 24),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SelectedBookCard(
                bookCardModels: bookCardModels,
              ),
              const SizedBox(
                height: 25,
              ),
              const DescriptionBook(),
              const SizedBox(
                height: 25,
              ),
              const AddCommentForRating(),
            ],
          ),
        ),
      ),
    );
  }
}
