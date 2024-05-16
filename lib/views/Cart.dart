import 'package:bookstore/constants.dart';
import 'package:bookstore/core/repo/checkout_repo_impl.dart';
import 'package:bookstore/cubits/get_books/get_user_Bookmarks_books/get_books_cubit.dart';
import 'package:bookstore/cubits/stripe/stripe_payment_cubit.dart';
import 'package:bookstore/helper/api.dart';
import 'package:bookstore/helper/local_network.dart';
import 'package:bookstore/views/payment_details.dart';
import 'package:bookstore/widgets/card_of_cart_book.dart';
import 'package:bookstore/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  double total = 0.0;
  @override
  void initState() {
    super.initState();
    context.read<GetmarksBooksCubit>().getmarksbooks();
  }

  @override
  Widget build(BuildContext context) {
    List<String> bookIds = [];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<GetmarksBooksCubit, GetBookmarkseState>(
            builder: (context, state) {
          if (state is GetmarkseBooksLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          } else if (state is GetmarkseBooksSuccess) {
            if (state.books.bookmarks!.isEmpty) {
              return Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Image.asset('assets/images/emptycart.jpg'),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Your cart is empty',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize:
                              getResponsiveFontSize(context, fontSize: 30),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<GetmarksBooksCubit, GetBookmarkseState>(
                      builder: (context, state) {
                        if (state is GetmarkseBooksLoading) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          );
                        } else if (state is GetmarkseBooksSuccess) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.books.bookmarks!.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              bookIds.add(state.books.bookmarks![index].sId!);
                              return Dismissible(
                                key: UniqueKey(),
                                onDismissed: (direction) async {
                                  await Api().delete(
                                    url:
                                        'https://book-store-api-mu.vercel.app/User/Bookmarks/${state.books.bookmarks![index].sId}',
                                    token:
                                        CacheNetwork.getCacheData(key: 'token'),
                                  );
                                  setState(() {
                                    context
                                        .read<GetmarksBooksCubit>()
                                        .getmarksbooks();
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: CardOfCartBook(
                                    image: state
                                        .books.bookmarks![index].image!.url!,
                                    title: state.books.bookmarks![index].title!,
                                    author:
                                        state.books.bookmarks![index].author!,
                                    price: state.books.bookmarks![index].price!
                                        .toString(),
                                    type:
                                        state.books.bookmarks![index].category!,
                                    bookid: state.books.bookmarks![index].sId!,
                                  ),
                                ),
                              );
                            },
                          );
                        } else if (state is GetmarkseBooksFailure) {
                          return const Center(
                            child: Text('Failed to load books: '),
                          );
                        }
                        return const SizedBox(
                          child: Text('Failed to load books'),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Order Summary',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize:
                                getResponsiveFontSize(context, fontSize: 20),
                            fontWeight: FontWeight.bold)),
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
                    BlocBuilder<GetmarksBooksCubit, GetBookmarkseState>(
                      builder: (context, state) {
                        if (state is GetmarkseBooksLoading) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          );
                        } else if (state is GetmarkseBooksSuccess) {
                          total = 0.0;
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.books.bookmarks!.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              total += state.books.bookmarks![index].price!;
                              return index == state.books.bookmarks!.length - 1
                                  ? Row(
                                      children: [
                                        Text(
                                          'Total',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: getResponsiveFontSize(
                                                  context,
                                                  fontSize: 20),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Spacer(),
                                        Text(
                                          '\$${total.toStringAsFixed(2)}',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: getResponsiveFontSize(
                                                context,
                                                fontSize: 20,
                                              ),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                  : Container();
                            },
                          );
                        } else if (state is GetmarkseBooksFailure) {
                          return const Center(
                            child: Text('Failed to load total: '),
                          );
                        }
                        return const SizedBox(
                          child: Text('Failed to load total'),
                        );
                      },
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
                                child: PaymentDeteils(
                                  prise: total.toInt(),
                                  bookIds: bookIds,
                                ),
                              );
                            });
                      },
                    )
                  ],
                ),
              );
            }
          } else if (state is GetmarkseBooksFailure) {
            return const Center(
              child: Text('Failed to load total: '),
            );
          }
          return const SizedBox(
            child: Text('Failed to load total'),
          );
        }),
      ),
    );
  }
}
