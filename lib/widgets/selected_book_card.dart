import 'package:bookstore/views/Cart.dart';
import 'package:flutter/material.dart';

class SelectedBookCard extends StatelessWidget {
  const SelectedBookCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(12),
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/topBooks1.png',
              height: 217,
              width: 138,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Author : Oscar Wilde',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Category : Classics',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Rating: 4.11/5',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                r'Pricing: $25.00',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const Cart(),
                      ));
                },
                child: Container(
                  decoration: ShapeDecoration(
                    color: Colors.black,
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 45, vertical: 12),
                  child: const Text(
                    'Add to Cart',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Color(0xFFF2F2F2)),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
