import 'package:bookstore/constants.dart';
import 'package:bookstore/core/repo/checkout_repo_impl.dart';
import 'package:bookstore/cubits/stripe/stripe_payment_cubit.dart';
import 'package:bookstore/views/payment_details.dart';
import 'package:bookstore/widgets/card_of_cart_book.dart';
import 'package:bookstore/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    List books = [
      {
        'image': 'assets/images/topBooks2.png',
        'title': 'Tuesday Mooney Talks to Ghosts',
        'author': 'Kate Racculia',
        'price': '\$25.00',
        'type': 'Novel',
        'key': '1'
      },
      {
        'image': 'assets/images/bestDeals.png',
        'title': 'Hello, Dream',
        'author': 'Cristina Camerena, Lady Desatia',
        'price': '\$17.00',
        'type': 'Adult Narrative',
        'key': '2'
      }
    ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                child: ListView.builder(
                  itemCount: books.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Visibility(
                      visible: books[index]['dismissed'] != true,
                      child: Dismissible(
                        key: Key(books[index]['key']),
                        onDismissed: (direction) {
                          setState(() {
                            books[index]['dismissed'] = true;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: CardOfCartBook(
                            image: books[index]['image'],
                            title: books[index]['title'],
                            author: books[index]['author'],
                            price: books[index]['price'],
                            type: books[index]['type'],
                          ),
                        ),
                      ),
                    );
                  },
                ),
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
                        fontSize: getResponsiveFontSize(context, fontSize: 16),
                        fontWeight: FontWeight.w400),
                  ),
                  const Spacer(),
                  Text(
                    '\$25.00',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: getResponsiveFontSize(context, fontSize: 16),
                      fontWeight: FontWeight.bold,
                    ),
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
                        fontSize: getResponsiveFontSize(context, fontSize: 16),
                        fontWeight: FontWeight.w400),
                  ),
                  const Spacer(),
                  Text(
                    '\$17.00',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: getResponsiveFontSize(context, fontSize: 16),
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
                        fontSize: getResponsiveFontSize(context, fontSize: 20),
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Text(
                    '\$42.00',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: getResponsiveFontSize(
                          context,
                          fontSize: 20,
                        ),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                color: Colors.black,
                title: 'Proceed to Checkout',
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      builder: (context) {
                        return BlocProvider(
                          create: (context) =>
                              StripePaymentCubit(CheckoutRepo()),
                          child: const PaymentDeteils(),
                        );
                      });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
