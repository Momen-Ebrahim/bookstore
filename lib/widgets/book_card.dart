import 'package:bookstore/views/selected_book_view.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const SelectedBookView(),
          ),
        );
      },
      child: Container(
        height: 320,
        width: 200,
        decoration: ShapeDecoration(
          color: const Color(0xFF121212),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/topBooks1.png',
                  height: 142,
                  width: 91,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Classics',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 15,
                  color: Color(0xFFDEDEDE),
                ),
              ),
              const Text(
                'The Picture of Dorian',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color(0xFFFFFFFF),
                ),
              ),
              const Text(
                'Gray',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color(0xFFFFFFFF),
                ),
              ),
              const Text(
                'Oscar Wilde',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Color(0xFFFFFFFF),
                ),
              ),
              const Text(
                r'$25.00',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
