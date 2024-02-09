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
                const Text(
                  'Novel',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFFDEDEDE),
                  ),
                ),
                const Text(
                  'Tuesday Mooney',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                const Text(
                  'Talks to Ghosts',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                const Text(
                  'Kate Racculia',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      r'$33.00',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFFFFFF),
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
                      child: const Text(
                        '12% off',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Color(0xFF000000),
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
