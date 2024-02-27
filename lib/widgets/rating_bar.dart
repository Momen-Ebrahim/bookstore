import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBarWidget extends StatelessWidget {
  const RatingBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      itemSize: 20,
      initialRating: 3,
      unratedColor: Colors.grey,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemPadding: const EdgeInsets.symmetric(horizontal: 3),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {},
    );
  }
}
