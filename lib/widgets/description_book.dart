import 'package:flutter/material.dart';

class DescriptionBook extends StatelessWidget {
  const DescriptionBook({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Description:',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Oscar Wilde’s only novel is the dreamlike story of a young man who sells his soul for eternal youth and beauty. In this celebrated work Wilde forged a devastating portrait of the effects of evil and debauchery on a young aesthete in late-19th-century England. Combining elements of the Gothic horror novel and decadent French fiction, the book centers on a striking premise: As Dorian Gray sinks into a life of crime and gross sensuality, his body retains perfect youth and vigor while his recently painted portrait grows day by day into a hideous record of evil, which he must keep hidden from the world. For over a century, this mesmerizing tale of horror and suspense has enjoyed wide popularity. It ranks as one of Wilde\'s most important creations and among the classic achievements of its kind.',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
