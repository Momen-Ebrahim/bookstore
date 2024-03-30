import 'package:bookstore/constants.dart';
import 'package:bookstore/widgets/card_of_cart_book.dart';
import 'package:bookstore/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class Cartinbook extends StatefulWidget {
  const Cartinbook({super.key});

  @override
  State<Cartinbook> createState() => _CartinbookState();
}

class _CartinbookState extends State<Cartinbook> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Your Cart',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: getResponsiveFontSize(context, fontSize: 24),
                  fontWeight: FontWeight.w600)),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CardOfCartBook(
                    image: 'assets/images/topBooks2.png',
                    title: 'Tuesday Mooney Talks to Ghosts',
                    author: 'Kate Racculia',
                    price: '\$25.00',
                    type: 'Novel'),
                const SizedBox(
                  height: 20,
                ),
                const CardOfCartBook(
                  image: 'assets/images/bestDeals.png',
                  type: 'Adult Narrative',
                  title: 'Hello, Dream',
                  author: 'Cristina Camerena, Lady Desatia',
                  price: '\$17.00',
                ),
                const SizedBox(
                  height: 20,
                ),
                Text('Order Summary',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: getResponsiveFontSize(context, fontSize: 20),
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Subtotal',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize:
                              getResponsiveFontSize(context, fontSize: 16),
                          fontWeight: FontWeight.w400),
                    ),
                    const Spacer(),
                    Text(
                      '\$25.00',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize:
                              getResponsiveFontSize(context, fontSize: 16),
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Subtotal',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize:
                              getResponsiveFontSize(context, fontSize: 16),
                          fontWeight: FontWeight.w400),
                    ),
                    const Spacer(),
                    Text(
                      '\$17.00',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize:
                              getResponsiveFontSize(context, fontSize: 16),
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize:
                              getResponsiveFontSize(context, fontSize: 20),
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Text(
                      '\$42.00',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize:
                              getResponsiveFontSize(context, fontSize: 20),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomButton(
                    color: Colors.black, title: 'Proceed to Checkout')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
