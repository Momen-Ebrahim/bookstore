import 'package:bookstore/models/book_card_models.dart';
import 'package:bookstore/widgets/cart_when_pressinbook.dart';
import 'package:bookstore/widgets/rating_bar.dart';
import 'package:flutter/material.dart';

class SelectedBookCard extends StatelessWidget {
  const SelectedBookCard({super.key, required this.bookCardModels});
  final BookCardModels bookCardModels;
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
                child: Image.asset(
                  bookCardModels.image,
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
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Author : ${bookCardModels.autherName}',
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Category : ${bookCardModels.category}',
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Pricing :     ${bookCardModels.price}',
                style: const TextStyle(
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
                        builder: (BuildContext context) => const Cartinbook(),
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
