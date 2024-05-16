import 'package:bookstore/widgets/custom_text_form_field.dart';
import 'package:bookstore/widgets/rating_bar.dart';
import 'package:flutter/material.dart';

class AddCommentForRating extends StatelessWidget {
  const AddCommentForRating({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: CustomTextFormField(
        obscureText: false,
        hintText: 'Add Comment ...',
        suffixIcon: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Center(child: Text("Rate this Book ..")),
                  content: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RatingBarWidget(size: 40, rating: 0),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "ok",
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                );
              },
            );
          },
          icon: const Icon(Icons.send),
        ),
      ),
    );
  }
}
