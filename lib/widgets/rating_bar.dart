import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBarWidget extends StatelessWidget {
  const RatingBarWidget({
    super.key,
    required this.size,
    required this.rating,
  });
  final int size;
  final double rating;
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      itemSize: size.toDouble(),
      initialRating: rating,
      unratedColor: Colors.grey,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {},
    );
  }
}
