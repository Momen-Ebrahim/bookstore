import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class PaymentItem extends StatelessWidget {
  PaymentItem({
    super.key,
    required this.image,
    required this.isSelected,
  });
  String image;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 103,
        height: 62,
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: isSelected ? Colors.black : Colors.grey, width: 1.5),
              borderRadius: BorderRadius.circular(15),
            ),
            shadows: [
              BoxShadow(
                color: isSelected ? Colors.black : Colors.grey,
                blurRadius: 4,
              )
            ]),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: SvgPicture.asset(image, height: 62, fit: BoxFit.scaleDown),
          ),
        ),
      ),
    );
  }
}
