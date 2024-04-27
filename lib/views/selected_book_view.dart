import 'package:bookstore/constants.dart';
import 'package:bookstore/widgets/add_comment_for_rating.dart';
import 'package:bookstore/widgets/description_book.dart';
import 'package:bookstore/widgets/selected_book_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SelectedBookView extends StatelessWidget {
  const SelectedBookView({super.key, required this.image, required this.title, this.price, required this.category, required this.autherName, required this.description});
final String image;
  final String title;
  final price;
  final String category;
  final String autherName;
      final String description;

  @override
  Widget build(BuildContext context) {
    

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
          category,
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
                  title,
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
                image: image,
                title: title,
                price: price,
                category: category,
                autherName: autherName,
              ),
              const SizedBox(
                height: 25,
              ),
               DescriptionBook(description: description),
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
