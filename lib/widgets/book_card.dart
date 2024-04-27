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
  });
  final String image;
  final String title;
  final price;
  final String category;
  final String autherName;
  final String description;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => SelectedBookView(
              image: image,
              title: title,
              price: price,
              category: category,
              autherName: autherName,
              description: description,
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
              child: Image.network(
                image,
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
                    Text(
                      category,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: getResponsiveFontSize(context, fontSize: 14),
                        color: const Color(0xFFDEDEDE),
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
                      autherName,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: getResponsiveFontSize(context, fontSize: 14),
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    price != null
                        ? Text(
                            '$price',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize:
                                  getResponsiveFontSize(context, fontSize: 24),
                              color: const Color(0xFFFFFFFF),
                            ),
                          )
                        : Container(),
                    const SizedBox(
                      height: 5,
                    ),
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
