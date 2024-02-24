import 'package:bookstore/widgets/add_comment_for_rating.dart';
import 'package:bookstore/widgets/description_book.dart';
import 'package:bookstore/widgets/selected_book_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SelectedBookView extends StatelessWidget {
  const SelectedBookView({super.key});

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
        title: const Text(
          'Classics',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
              color: Color(0xFF121212)),
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
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'The Picture of Dorian Gray',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              SelectedBookCard(),
              SizedBox(
                height: 25,
              ),
              DescriptionBook(),
              SizedBox(
                height: 25,
              ),
              AddCommentForRating(),
            ],
          ),
        ),
      ),
    );
  }
}
