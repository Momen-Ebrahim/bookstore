import 'package:bookstore/constants.dart';
import 'package:bookstore/models/book_card_models.dart';
import 'package:bookstore/widgets/rating_bar.dart';
import 'package:flutter/material.dart';

class BookCardOfSelectedCategory extends StatelessWidget {
  const BookCardOfSelectedCategory({Key? key, required this.bookCardModels})
      : super(key: key);

  final BookCardModels bookCardModels;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (BuildContext context) => SelectedBookView(
        //       bookCardModels: bookCardModels,
        //     ),
        //   ),
        // );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Container(
          height: 170,
          width: MediaQuery.of(context).size.width,
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
                  height: 170,
                  width: 200,
                  decoration: const ShapeDecoration(
                    color: Color(0xFFBBBBBB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                child: Image.network(
                  bookCardModels.image,
                  width: 200,
                  height: 160,
                ),
              ),
              Positioned(
                right: 5,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        bookCardModels.category,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize:
                              getResponsiveFontSize(context, fontSize: 14),
                          color: const Color(0xFFDEDEDE),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        bookCardModels.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize:
                              getResponsiveFontSize(context, fontSize: 15),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        bookCardModels.autherName,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize:
                              getResponsiveFontSize(context, fontSize: 14),
                          color: const Color(0xFFFFFFFF),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        bookCardModels.price,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize:
                              getResponsiveFontSize(context, fontSize: 24),
                          color: const Color(0xFFFFFFFF),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      RatingBarWidget(
                        size: 20,
                        rating: bookCardModels.rating,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
