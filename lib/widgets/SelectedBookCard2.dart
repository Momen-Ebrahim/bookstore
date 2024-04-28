import 'package:bookstore/constants.dart';
import 'package:bookstore/widgets/add_comment_for_rating.dart';
import 'package:bookstore/widgets/custom_button.dart';
import 'package:bookstore/widgets/description_book.dart';
import 'package:bookstore/widgets/rating_bar.dart';
import 'package:flutter/material.dart';

class SelectedBookCard2 extends StatelessWidget {
  const SelectedBookCard2(
      {super.key,
      r,
      required this.image,
      required this.title,
      required this.price,
      required this.category,
      required this.autherName,
      required this.description,
      required this.bookid});

  final String autherName;
  final String bookid;
  final String category;
  final String description;
  final String image;
  final String price;
  final String title;

  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(12),
        ),
      ),
      child: Column(
        children: [
          Container(
              width: double.infinity,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(12),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: hight * 0.35,
                    width: width * 0.5,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                      child: Image.network(
                        image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: hight * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize:
                                getResponsiveFontSize(context, fontSize: 35),
                          ),
                        ),
                        SizedBox(
                          height: hight * 0.01,
                        ),
                        Text(
                          category,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize:
                                getResponsiveFontSize(context, fontSize: 25),
                          ),
                        ),
                        SizedBox(
                          height: hight * 0.01,
                        ),
                        Text(
                          'By: $autherName',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize:
                                getResponsiveFontSize(context, fontSize: 30),
                          ),
                        ),
                        SizedBox(
                          height: hight * 0.01,
                        ),
                        const RatingBarWidget(
                          size: 45,
                        ),
                        SizedBox(
                          height: hight * 0.02,
                        ),
                        Container(
                          height: hight * .06,
                          width: width * .25,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              '\$$price',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: getResponsiveFontSize(context,
                                    fontSize: 27),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: hight * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.4,
                              child: CustomButton(
                                color: Colors.black,
                                title: 'Buy Now',
                                onTap: () {},
                              ),
                            ),
                            SizedBox(
                              width: width * 0.4,
                              child: CustomButton(
                                color: Colors.black,
                                title: 'Add to Cart',
                                onTap: () {},
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )),
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
    );
  }
}
