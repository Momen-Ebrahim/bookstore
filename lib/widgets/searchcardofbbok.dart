import 'package:bookstore/constants.dart';
import 'package:bookstore/views/selected_book_view.dart';
import 'package:bookstore/widgets/rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SearchCardOfCartBook extends StatelessWidget {
  const SearchCardOfCartBook(
      {super.key,
      required this.image,
      required this.title,
      required this.autherName,
      required this.price,
      required this.category,
      required this.bookid,
      required this.rate});
  final String image;
  final String title;
  final String autherName;
  final String price;
  final String category;
  final String bookid;
  final double rate;
  @override
  Widget build(BuildContext context) {
    return Intl.getCurrentLocale() != 'ar'
        ? engcart(context)
        : arabiccart(context);
  }

  InkWell engcart(BuildContext context) {
    return InkWell(
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
      child: Container(
        padding: const EdgeInsets.all(0),
        height: MediaQuery.of(context).size.height * (155 / 812),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12)),
              child: Image.network(
                image,
                height: MediaQuery.of(context).size.height * (155 / 812),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * (10 / 360),
            ),
            Container(
              padding: const EdgeInsets.only(top: 5),
              width: MediaQuery.of(context).size.width * (120 / 360),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    category,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getResponsiveFontSize(context, fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    title,
                    style: TextStyle(
                        fontSize: getResponsiveFontSize(context, fontSize: 13),
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    autherName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getResponsiveFontSize(context, fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RatingBarWidget(size: 20, rating: rate),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: price != 'Owned'
                          ? price != ''
                              ? Text(r"$" "$price",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: getResponsiveFontSize(context,
                                        fontSize: 20),
                                    fontWeight: FontWeight.bold,
                                  ))
                              : const Text("")
                          : const Text("")),
                ],
              ),
            ),
            // const Spacer(),
          ],
        ),
      ),
    );
  }

  InkWell arabiccart(BuildContext context) {
    return InkWell(
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
      child: Container(
        padding: const EdgeInsets.all(0),
        height: MediaQuery.of(context).size.height * (155 / 812),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              child: Image.network(
                image,
                height: MediaQuery.of(context).size.height * (155 / 812),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * (10 / 360),
            ),
            Container(
              padding: const EdgeInsets.only(top: 5),
              width: MediaQuery.of(context).size.width * (120 / 360),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    category,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getResponsiveFontSize(context, fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    title,
                    style: TextStyle(
                      fontSize: getResponsiveFontSize(context, fontSize: 13),
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    autherName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getResponsiveFontSize(context, fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RatingBarWidget(size: 20, rating: rate),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: price != 'Owned'
                          ? price != ''
                              ? Text(
                                  r"$" "$price",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: getResponsiveFontSize(context,
                                        fontSize: 20),
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : const Text("")
                          : const Text("")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
