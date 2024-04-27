import 'package:bookstore/constants.dart';
import 'package:bookstore/views/cart.dart';
import 'package:bookstore/widgets/rating_bar.dart';
import 'package:flutter/material.dart';

class SelectedBookCard extends StatelessWidget {
  const SelectedBookCard(
      {super.key,
      r,
      required this.image,
      required this.title,
      this.price,
      required this.category,
      required this.autherName});
  final String image;
  final String title;
  final price;
  final String category;
  final String autherName;
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
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  image,
                  height: 217,
                  width: 138,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const RatingBarWidget(),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Author : $autherName',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: getResponsiveFontSize(context, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Category : $category',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: getResponsiveFontSize(context, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Pricing :     $price',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: getResponsiveFontSize(context, fontSize: 20),
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
                    ),
                  );
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
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: getResponsiveFontSize(context, fontSize: 18),
                        color: const Color(0xFFF2F2F2)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
