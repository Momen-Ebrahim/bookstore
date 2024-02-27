import 'package:bookstore/views/user_view/Cart.dart';
import 'package:flutter/material.dart';

class BookView extends StatefulWidget {
  const BookView({super.key});

  @override
  State<BookView> createState() => _BookViewState();
}

class _BookViewState extends State<BookView> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: height * (9.5 / 14.5),
                width: double.infinity,
                color: Colors.black,
                child: Column(
                  children: [
                    SizedBox(
                      height: height * .08,
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                      child: Image.asset(
                        'assets/images/topBooks2.png',
                        width: width * .5,
                        height: height * (5 / 14.5),
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
                    const Text(
                      'Book name',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: height * .01,
                    ),
                    const Text("By: author",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.green,
                child: Column(
                  children: [
                    Container(
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(12),
                        ),
                      ),
                      child: Column(
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
                                    builder: (BuildContext context) =>
                                        const Cart(),
                                  ));
                            },
                            child: Container(
                              decoration: ShapeDecoration(
                                color: Colors.black,
                                shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 45, vertical: 12),
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
                    ),
                    Column(
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
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
