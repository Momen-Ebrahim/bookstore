import 'package:bookstore/constants.dart';
import 'package:flutter/material.dart';

class ListSettings extends StatelessWidget {
  const ListSettings({
    super.key,
    this.onTap,
    required this.title,
    required this.iconData,
  });
  final Function()? onTap;
  final String title;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.black,
          child: Icon(
            iconData,
            color: Colors.white,
            size: 20,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: getResponsiveFontSize(context, fontSize: 18),
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Transform.rotate(
            angle: 3.14,
            child: const Icon(
              Icons.arrow_back_ios_new,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
