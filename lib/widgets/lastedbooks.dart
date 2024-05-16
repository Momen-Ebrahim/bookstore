import 'package:bookstore/constants.dart';
import 'package:bookstore/cubits/get_books/get_newarrival_books/get_books_cubit.dart';
import 'package:bookstore/widgets/book_card.dart';
import 'package:bookstore/widgets/see_all/see_all_Lastest_Books.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooknewarrivalCardListView extends StatefulWidget {
  const BooknewarrivalCardListView({super.key});

  @override
  State<BooknewarrivalCardListView> createState() =>
      _BooknewarrivalCardListViewState();
}

class _BooknewarrivalCardListViewState
    extends State<BooknewarrivalCardListView> {
  @override
  void initState() {
    super.initState();

    context.read<GetnewarrivalBooksCubit>().getnewarrivalbooks();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Lastest Books',
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
                  MaterialPageRoute(
                      builder: (context) => const SeeAllLastestBooks()),
                );
              },
              child: Row(
                children: [
                  Text(
                    'See All',
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
        BlocBuilder<GetnewarrivalBooksCubit, GearrivalBooksState>(
          builder: (context, state) {
            if (state is GetnewarrivalBooksLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            } else if (state is GetnewarrivalBooksSuccess) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.books.book!.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: BookCard(
                        image: state.books.book![index].image!.url.toString(),
                        title: state.books.book![index].title!,
                        price: state.books.book![index].price.toString(),
                        category: state.books.book![index].category!,
                        autherName: state.books.book![index].author!,
                        description: state.books.book![index].description!,
                        bookid: state.books.book![index].sId!,
                        rating: state.books.book![index].averageRating!.toDouble(),
                      ),
                    );
                  }),
                ),
              );
            } else if (state is GetnewarrivalBooksFailure) {
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
