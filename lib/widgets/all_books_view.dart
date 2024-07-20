import 'package:bookstore/constants.dart';
import 'package:bookstore/cubits/get_books/get_books/get_books_cubit.dart';
import 'package:bookstore/generated/l10n.dart';
import 'package:bookstore/widgets/book_card.dart';
import 'package:bookstore/widgets/custom_loading_small_card.dart';
import 'package:bookstore/widgets/see_all/see_all_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllBooksView extends StatefulWidget {
  const AllBooksView({super.key});

  @override
  State<AllBooksView> createState() => _AllBooksViewState();
}

class _AllBooksViewState extends State<AllBooksView> {
  @override
  void initState() {
    super.initState();

    context.read<GetallBooksCubit>().getbooks();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              S.of(context).AllBooks,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: getResponsiveFontSize(context, fontSize: 28),
                color: const Color(0xFF121212),
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SeeAllBooks()),
                );
              },
              child: Row(
                children: [
                  Text(
                    S.of(context).SeeAll,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: getResponsiveFontSize(context, fontSize: 20),
                      color: const Color(0xFF121212),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 35,
        ),
        BlocBuilder<GetallBooksCubit, GetbookState>(
          builder: (context, state) {
            if (state is GetBooksLoading) {
              return const CustomLoadingSmallCard();
            } else if (state is GetbooksSuccess) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.38,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.books.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: BookCard(
                        image: state.books[index].image!.url.toString(),
                        title: state.books[index].title!,
                        price: state.books[index].onsale!
                            ? state.books[index].saleprice!.toString()
                            : state.books[index].price!.toString(),
                        category: state.books[index].category!,
                        autherName: state.books[index].author!,
                        description: state.books[index].description!,
                        bookid: state.books[index].sId!,
                        rating: state.books[index].averageRating!.toDouble(),
                      ),
                    );
                  }),
                ),
              );
            } else if (state is GetBooksFailure) {
              return const Center(
                child: Text('Failed to load books: '),
              );
            }
            return const SizedBox(
              child: Text('Failed to load books'),
            );
          },
        ),
      ],
    );
    // return Row(
    //   children: bookCardImage
    //       .map((e) => const Expanded(
    //             child: Padding(
    //               padding: EdgeInsets.only(left: 12),
    //               child: BookCardd(
    //                 image: 'assets/images/topBooks2.png',
    //               ),
    //             ),
    //           ))
    //       .toList(),
    // );
  }
}
