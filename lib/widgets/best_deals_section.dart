import 'package:bookstore/constants.dart';
import 'package:bookstore/cubits/get_books/get_onsale_books/get_books_cubit.dart';
import 'package:bookstore/widgets/dots_indicator.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestDealsSection extends StatefulWidget {
  const BestDealsSection({super.key});

  @override
  State<BestDealsSection> createState() => _BestDealsSectionState();
}

class _BestDealsSectionState extends State<BestDealsSection> {
  int currentPageIndex = 0;
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPageIndex = pageController.page!.round();
      setState(() {});
    });
    super.initState();
    context.read<GetonsaleBooksCubit>().getonsalebooks();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Best Deals',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: getResponsiveFontSize(context, fontSize: 32),
            color: const Color(0xFF111111),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        ExpandablePageView(
            scrollDirection: Axis.horizontal,
            controller: pageController,
            children: [
              BlocBuilder<GetonsaleBooksCubit, GetonsaleBooksState>(
                builder: (context, state) {
                  if (state is GetonsaleBooksLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    );
                  } else if (state is GetonsaleBooksSuccess) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * .25,
                      child: ListView.builder(
                        itemCount: state.books.book!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Expanded(
                            child: Column(
                              children: [
                                Container(
                                  decoration: ShapeDecoration(
                                      color: Colors.black,
                                      shape: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          bottomLeft: Radius.circular(12),
                                        ),
                                        child: Image.network(
                                          state.books.book![index].image!.url
                                              .toString(),
                                          height: height * (155 / 812),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              state
                                                  .books.book![index].category!,
                                              style: TextStyle(
                                                fontSize: getResponsiveFontSize(
                                                    context,
                                                    fontSize: 15),
                                                fontWeight: FontWeight.w300,
                                                color: const Color(0xFFDEDEDE),
                                              ),
                                            ),
                                            Text(
                                              state.books.book![index].title!,
                                              style: TextStyle(
                                                fontSize: getResponsiveFontSize(
                                                    context,
                                                    fontSize: 21),
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xFFFFFFFF),
                                              ),
                                            ),
                                            Text(
                                              state.books.book![index].author!,
                                              style: TextStyle(
                                                fontSize: getResponsiveFontSize(
                                                    context,
                                                    fontSize: 15),
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xFFFFFFFF),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  '\$6', // Display discounted price
                                                  style: TextStyle(
                                                    fontSize:
                                                        getResponsiveFontSize(
                                                            context,
                                                            fontSize: 30),
                                                    fontWeight: FontWeight.w600,
                                                    color: const Color(
                                                        0xFFFFFFFF), // White color for discounted price
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                  '\$12', // Display original price
                                                  style: TextStyle(
                                                    decoration: TextDecoration
                                                        .lineThrough, // Add a line through the text
                                                    fontSize:
                                                        getResponsiveFontSize(
                                                            context,
                                                            fontSize: 25),
                                                    fontWeight: FontWeight.w600,
                                                    color: const Color(
                                                        0xFF999999), // Gray color for original price
                                                  ),
                                                ),
                                                // Add some space between original and discounted price

                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Container(
                                                  decoration: ShapeDecoration(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2),
                                                    ),
                                                    color: Colors.white,
                                                  ),
                                                  child: Text(
                                                    '50% off',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize:
                                                          getResponsiveFontSize(
                                                              context,
                                                              fontSize: 15),
                                                      color: const Color(
                                                          0xFF000000),
                                                    ),
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
                                const SizedBox(
                                  height: 20,
                                ),
                                DotsIndicator(
                                    length: state.books.book!.length,
                                    currentPageIndex: currentPageIndex),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  } else if (state is GetonsaleBooksFailure) {
                    return const Center(
                      child: Text('Failed to load books: '),
                    );
                  }
                  return const SizedBox(
                    child: Text('Failed to load books'),
                  );
                },
              )
            ]),
      ],
    );
  }
}
