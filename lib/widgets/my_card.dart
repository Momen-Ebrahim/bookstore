import 'package:bookstore/constants.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({super.key, required this.image, required this.listLength});
  final String image;
  final int listLength;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
          color: Colors.black,
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
      child: Row(
        children: [
          Image.asset(
            image,
            width: 100,
            height: 150,
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Novel',
                  style: TextStyle(
                    fontSize: getResponsiveFontSize(context, fontSize: 15),
                    fontWeight: FontWeight.w300,
                    color: const Color(0xFFDEDEDE),
                  ),
                ),
                Text(
                  'Tuesday Mooney',
                  style: TextStyle(
                    fontSize: getResponsiveFontSize(context, fontSize: 21),
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFFFFFFF),
                  ),
                ),
                Text(
                  'Talks to Ghosts',
                  style: TextStyle(
                    fontSize: getResponsiveFontSize(context, fontSize: 21),
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFFFFFFF),
                  ),
                ),
                Text(
                  'Kate Racculia',
                  style: TextStyle(
                    fontSize: getResponsiveFontSize(context, fontSize: 15),
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFFFFFFFF),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      r'$33.00',
                      style: TextStyle(
                        fontSize: getResponsiveFontSize(context, fontSize: 30),
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        color: Colors.white,
                      ),
                      child: Text(
                        '12% off',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize:
                              getResponsiveFontSize(context, fontSize: 15),
                          color: const Color(0xFF000000),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
