<<<<<<< HEAD
import 'package:bookstore/models/book_card_models.dart';
import 'package:bookstore/views/admin_view/selected_book_view.dart';
import 'package:bookstore/widgets/rating_bar.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.bookCardModels});
  final BookCardModels bookCardModels;
=======
import 'package:bookstore/views/selected_book_view.dart';
import 'package:bookstore/widgets/rating_bar.dart';
import 'package:flutter/material.dart';

class BookCardd extends StatelessWidget {
  const BookCardd({super.key, required this.image});
  final String image;
>>>>>>> 47f1769b8636468b250d00101c381a77bc1e1e29
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const SelectedBookView(),
            settings: RouteSettings(
              arguments: bookCardModels,
            ),
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
        child: Stack(
          children: [
            Positioned(
              child: Container(
                height: 160,
                width: 200,
                decoration: const ShapeDecoration(
                  color: Color(0xFFBBBBBB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              child: Image.asset(
<<<<<<< HEAD
                bookCardModels.image,
=======
                image,
>>>>>>> 47f1769b8636468b250d00101c381a77bc1e1e29
                width: 200,
                height: 150,
              ),
            ),
            Positioned(
              top: 165,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
<<<<<<< HEAD
                    Text(
                      bookCardModels.category,
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
=======
                    const Text(
                      'Classics',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 15,
>>>>>>> 47f1769b8636468b250d00101c381a77bc1e1e29
                        color: Color(0xFFDEDEDE),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
<<<<<<< HEAD
                    Text(
                      bookCardModels.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    // RichText(
                    //   text: const  TextSpan(
                    //     style: TextStyle(color: Colors.white),
                    //     children: [
                    //       TextSpan(
                    //         text: 'The Picture of Dorian\n Gray',
                    //         style: TextStyle(
                    //           fontWeight: FontWeight.w600,
                    //           fontSize: 15,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Text(
                      bookCardModels.autherName,
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      bookCardModels.price,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
=======
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(color: Colors.white),
                        children: [
                          TextSpan(
                            text: 'The Picture of Dorian\n Gray',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
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
>>>>>>> 47f1769b8636468b250d00101c381a77bc1e1e29
                    const RatingBarWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
