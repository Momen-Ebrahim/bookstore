import 'package:bookstore/constants.dart';
import 'package:flutter/material.dart';

class CommentsOfBook extends StatelessWidget {
  const CommentsOfBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.asset('assets/images/accountpic.png'),
              title: Text(
                'This book is very interesting. I recommend reading it',
                style: TextStyle(
                  fontSize: getResponsiveFontSize(context, fontSize: 16),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
