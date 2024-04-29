import 'package:bookstore/constants.dart';
import 'package:bookstore/views/selected_book_view.dart';
import 'package:bookstore/widgets/rating_bar.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    super.key,
    required this.image,
    required this.title,
    this.price,
    required this.category,
    required this.autherName,
    required this.description,
    required this.bookid,
  });
  final String image;
  final String title;
  final price;
  final String category;
  final String autherName;
  final String description;
  final String bookid;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * (100 / 812),
      width: MediaQuery.of(context).size.width * (180 / 430),
      decoration: ShapeDecoration(
        color: const Color(0xFF121212),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: GestureDetector(
        onTap: price != ''
            ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => SelectedBookView(
                      bookid: bookid,
                      title: title,
                    ),
                  ),
                );
              }
            : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.network(
                image,
                height: MediaQuery.of(context).size.height * (160 / 812),
                width: MediaQuery.of(context).size.width * (150 / 360),
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: getResponsiveFontSize(context, fontSize: 12),
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getResponsiveFontSize(context, fontSize: 15),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'By: $autherName',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: getResponsiveFontSize(context, fontSize: 12),
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  price != ''
                      ? Text(
                          '\$$price',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize:
                                getResponsiveFontSize(context, fontSize: 24),
                            color: Colors.white,
                          ),
                        )
                      : Text(
                          '',
                          style: TextStyle(
                            fontSize:
                                getResponsiveFontSize(context, fontSize: 24),
                            color: Colors.white,
                          ),
                        ),
                  const SizedBox(
                    height: 5,
                  ),
                  const RatingBarWidget(
                    size: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
