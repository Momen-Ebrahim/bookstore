import 'package:flutter/material.dart';

class CardOfCartbook extends StatefulWidget {
  const CardOfCartbook(
      {super.key,
      required this.image,
      required this.title,
      required this.author,
      required this.price,
      required this.type});
  final String image;
  final String title;
  final String author;
  final String price;
  final String type;

  @override
  State<CardOfCartbook> createState() => CcardOfCartbookState();
}

int _counter = 1;

class CcardOfCartbookState extends State<CardOfCartbook> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(0),
      height: height * (155 / 812),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.black,
      ),
      child: Row(children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
          child: Image.asset(
            widget.image,
            height: height * (155 / 812),
          ),
        ),
        SizedBox(
          width: width * (10 / 360),
        ),
        Container(
          padding: EdgeInsets.only(top: height * (15 / 800)),
          width: width * (120 / 360),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(widget.type,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w300)),
              SizedBox(height: height * (10 / 800)),
              Text(
                widget.title,
                style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: height * (15 / 800)),
              Text("By: ${widget.author}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400)),
              const Spacer(),
            ],
          ),
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                )),
            const Spacer(),
            Row(
              children: [
                Text(widget.price,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  width: width * (10 / 360),
                )
              ],
            ),
            SizedBox(
              height: height * (10 / 800),
            )
          ],
        ),
      ]),
    );
  }
}
