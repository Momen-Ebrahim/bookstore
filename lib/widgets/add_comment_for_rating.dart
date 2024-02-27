import 'package:bookstore/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class AddCommentForRating extends StatelessWidget {
  const AddCommentForRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(
              height: 20,
            ),
            const Text(
              'Comments',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ListTile(
              leading: Image.asset('assets/images/accountpic.png'),
              title: const Text(
                'This book is very interesting. I recommend reading it',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const CustomTextFormField(
              hintText: 'Add Comment ...',
              suffixIcon: Icon(Icons.send),
            ),
          ],
        ));
  }
}
