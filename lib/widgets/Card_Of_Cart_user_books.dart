import 'package:bookstore/constants.dart';
import 'package:flutter/material.dart';

class CardOfUserBooks extends StatefulWidget {
  CardOfUserBooks({
    super.key,
    required this.image,
    required this.title,
    required this.author,
    required this.price,
    required this.type,
    required this.ontap,
  });
  final String image;
  final String title;
  final String author;
  final String price;
  final String type;
  final Function ontap;
  @override
  State<CardOfUserBooks> createState() => CardOfUserBooksState();
}

class CardOfUserBooksState extends State<CardOfUserBooks> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        widget.ontap();
      },
      child: Container(
        padding: const EdgeInsets.all(0),
        height: height * (155 / 812),
        width: width * (330 / 360),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black,
        ),
        child: Row(children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: Image.asset(
              widget.image,
              height: height * (155 / 812),
            ),
          ),
          SizedBox(
            width: width * (10 / 360),
          ),
          Container(
            padding: EdgeInsets.only(
              top: height * (15 / 800),
            ),
            width: width * (200 / 360),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(widget.type,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: getResponsiveFontSize(context, fontSize: 12),
                        fontWeight: FontWeight.w300)),
                SizedBox(
                  height: height * (10 / 800),
                ),
                Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: getResponsiveFontSize(context, fontSize: 20),
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: height * (10 / 800),
                ),
                Text(
                  "By: ${widget.author}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: getResponsiveFontSize(context, fontSize: 15),
                      fontWeight: FontWeight.w400),
                ),
                const Spacer(),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
