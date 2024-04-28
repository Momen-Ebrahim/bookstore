import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBarWidget extends StatelessWidget {
  const RatingBarWidget({
    super.key,
    required this.size,
  });
  final int size;
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      itemSize: size.toDouble(),
      initialRating: 3,
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
