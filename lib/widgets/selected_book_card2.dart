import 'package:bookstore/constants.dart';
import 'package:bookstore/core/repo/checkout_repo_impl.dart';
import 'package:bookstore/cubits/get_books/get_user_Bookmarks_books/get_books_cubit.dart';
import 'package:bookstore/cubits/stripe/stripe_payment_cubit.dart';
import 'package:bookstore/generated/l10n.dart';
import 'package:bookstore/helper/api.dart';
import 'package:bookstore/helper/local_network.dart';
import 'package:bookstore/models/book_id_model.dart';
import 'package:bookstore/views/payment_details.dart';
import 'package:bookstore/widgets/add_comment_for_rating.dart';
import 'package:bookstore/widgets/comments_of_book.dart';
import 'package:bookstore/widgets/custom_button.dart';
import 'package:bookstore/widgets/custom_loading_selected_book.dart';
import 'package:bookstore/widgets/description_book.dart';
import 'package:bookstore/widgets/rating_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedBookCard2 extends StatefulWidget {
  const SelectedBookCard2(
      {super.key,
      required this.image,
      required this.title,
      required this.price,
      required this.category,
      required this.autherName,
      required this.description,
      required this.bookid,
      required this.rating,
      required this.reviews,
      required this.isOwned,
      required this.publishDate});

  final String autherName;
  final String bookid;
  final String category;
  final String description;
  final String image;
  final String price;
  final String title;
  final double rating;
  final List<Review> reviews;
  final bool isOwned;
  final DateTime publishDate;

  @override
  State<SelectedBookCard2> createState() => _SelectedBookCard2State();
}

class _SelectedBookCard2State extends State<SelectedBookCard2> {
  bool iscart = false;
  bool cartshipCheckComplete = false;
  bool ischange = false;

  @override
  void initState() {
    super.initState();
    context.read<GetmarksBooksCubit>().getmarksbooks();
  }

  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return BlocListener<GetmarksBooksCubit, GetBookmarkseState>(
      listener: (context, state) {
        if (state is GetmarkseBooksSuccess) {
          setState(() {
            iscart =
                state.books.bookmarks!.any((book) => book.sId == widget.bookid);
          });
          cartshipCheckComplete = true;
        }
      },
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(12),
          ),
        ),
        child: widget.isOwned
            ? _buildOwnedBookCard(hight, width)
            : _buildUnownedBookCard(hight, width),
      ),
    );
  }

  Widget _buildOwnedBookCard(double hight, double width) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(12),
            ),
            color: Colors.white,
          ),
          child: Column(
            children: [
              SizedBox(
                height: hight * 0.35,
                width: width * 0.5,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                  child: Image.network(
                    widget.image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: hight * 0.01),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: getResponsiveFontSize(context, fontSize: 35),
                      ),
                    ),
                    SizedBox(height: hight * 0.01),
                    Text(
                      widget.category,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: getResponsiveFontSize(context, fontSize: 25),
                      ),
                    ),
                    SizedBox(height: hight * 0.01),
                    Text(
                      'By: ${widget.autherName}',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: getResponsiveFontSize(context, fontSize: 30),
                      ),
                    ),
                    SizedBox(height: hight * 0.01),
                    Text(
                      'Published: ${widget.publishDate.day}/${widget.publishDate.month}/${widget.publishDate.year}',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: getResponsiveFontSize(context, fontSize: 30),
                      ),
                    ),
                    SizedBox(height: hight * 0.01),
                    RatingBarWidget(
                      rating: widget.rating,
                      size: 45,
                    ),
                    SizedBox(height: hight * 0.02),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 25),
        DescriptionBook(description: widget.description),
        const SizedBox(height: 25),
        const Divider(height: 20),
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            S.of(context).Comments,
            style: TextStyle(
              fontSize: getResponsiveFontSize(context, fontSize: 20),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        CommentsOfBook(bookid: widget.bookid, reviews: widget.reviews),
        AddCommentForRating(
          bookid: widget.bookid,
          title: widget.title,
        ),
      ],
    );
  }

  Widget _buildUnownedBookCard(double hight, double width) {
    return Column(children: [
      cartshipCheckComplete
          ? Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(12),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: hight * 0.35,
                        width: width * 0.5,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                          child: Image.network(
                            widget.image,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(height: hight * 0.01),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: [
                            Text(
                              widget.title,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: getResponsiveFontSize(context,
                                    fontSize: 35),
                              ),
                            ),
                            SizedBox(height: hight * 0.01),
                            Text(
                              widget.category,
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: getResponsiveFontSize(context,
                                    fontSize: 25),
                              ),
                            ),
                            SizedBox(height: hight * 0.01),
                            Text(
                              'By: ${widget.autherName}',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: getResponsiveFontSize(context,
                                    fontSize: 30),
                              ),
                            ),
                            Text(
                              'Published: ${widget.publishDate.day}/${widget.publishDate.month}/${widget.publishDate.year}',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: getResponsiveFontSize(context,
                                    fontSize: 30),
                              ),
                            ),
                            SizedBox(height: hight * 0.01),
                            SizedBox(height: hight * 0.01),
                            RatingBarWidget(
                              rating: widget.rating,
                              size: 45,
                            ),
                            SizedBox(height: hight * 0.02),
                            Container(
                              height: hight * .06,
                              width: width * .25,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  '\$${widget.price}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: getResponsiveFontSize(context,
                                        fontSize: 27),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: hight * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: width * 0.3,
                                  child: CustomButton(
                                    color: Colors.black,
                                    title: S.of(context).BuyNow,
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                        ),
                                        builder: (context) {
                                          return BlocProvider(
                                            create: (context) =>
                                                StripePaymentCubit(
                                                    CheckoutRepo()),
                                            child: PaymentDeteils(
                                              prise: double.parse(widget.price)
                                                  .toInt(),
                                              bookIds: [widget.bookid],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.5,
                                  child: CustomButton(
                                    color: Colors.black,
                                    title: iscart
                                        ? S.of(context).DeletefromCart
                                        : S.of(context).AddtoCart,
                                    onTap: () async {
                                      setState(() {
                                        ischange = true;
                                      });
                                      if (iscart) {
                                        await _deleteFromCart();
                                        ischange = false;
                                      } else {
                                        await _addToCart();
                                        ischange = false;
                                      }
                                    },
                                    isSeloading: ischange,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                DescriptionBook(description: widget.description),
                const SizedBox(height: 25),
                const Divider(height: 20),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    S.of(context).Comments,
                    style: TextStyle(
                      fontSize: getResponsiveFontSize(context, fontSize: 20),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CommentsOfBook(bookid: widget.bookid, reviews: widget.reviews),
              ],
            )
          : const CustomLoadingSelectedBook()
    ]);
  }

  Future<void> _addToCart() async {
    try {
      final response = await Api().post(
        token: CacheNetwork.getCacheData(key: 'token'),
        url:
            'https://book-store-api-mu.vercel.app/User/Bookmarks/${widget.bookid}',
      );
      if (response != null && response['status'] == 'success') {
        setState(() {
          iscart = true;
          if (kDebugMode) {
            print('Added to cart successfully');
          }
        });
      } else {
        iscart = true;
        if (kDebugMode) {
          print('Failed to add to cart: $response');
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error adding to cart: $error');
      }
    }
  }

  Future<void> _deleteFromCart() async {
    await Api()
        .delete(
      url:
          'https://book-store-api-mu.vercel.app/User/Bookmarks/${widget.bookid}',
      token: CacheNetwork.getCacheData(key: 'token'),
    )
        .then((response) {
      setState(() {
        iscart = false;
        if (kDebugMode) {
          print('Deleted from cart successfully');
        }
      });
    }).catchError((error) {
      if (kDebugMode) {
        print('Error deleting from cart: $error');
      }
    });
  }
}
