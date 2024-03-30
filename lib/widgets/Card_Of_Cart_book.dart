import 'package:bookstore/constants.dart';
import 'package:flutter/material.dart';

class CardOfCartBook extends StatelessWidget {
  const CardOfCartBook(
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
  Widget build(BuildContext context) {
    return Container(
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
                topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
            child: Image.asset(
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
                  type,
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
                Text(author,
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
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  )),
              const Spacer(),
              Row(
                children: [
                  Text(price,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: getResponsiveFontSize(context, fontSize: 20),
                        fontWeight: FontWeight.bold,
                      )),
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
    );
  }
}
