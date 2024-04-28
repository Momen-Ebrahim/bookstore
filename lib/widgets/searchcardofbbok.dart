import 'package:bookstore/constants.dart';
import 'package:bookstore/views/selected_book_view.dart';
import 'package:flutter/material.dart';

class SearchCardOfCartBook extends StatelessWidget {
  const SearchCardOfCartBook(
      {super.key,
      required this.image,
      required this.title,
      required this.autherName,
      required this.price,
      required this.category,
      required this.bookid});
  final String image;
  final String title;
  final String autherName;
  final String price;
  final String category;
  final String bookid;
  @override
  Widget build(BuildContext context) {
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
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * (15 / 800)),
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
                    title,
                    style: TextStyle(
                        fontSize: getResponsiveFontSize(context, fontSize: 16),
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(autherName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: getResponsiveFontSize(context, fontSize: 16),
                      )),
                  const Spacer(),
                ],
              ),
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Spacer(),
                Row(
                  children: [
                    price != ''
                        ? Text("\$$price",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  getResponsiveFontSize(context, fontSize: 20),
                              fontWeight: FontWeight.bold,
                            ))
                        : const Text(""),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * (10 / 360),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * (10 / 800),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
