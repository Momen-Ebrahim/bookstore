import 'package:bookstore/constants.dart';
import 'package:bookstore/cubits/get_books/get_upcoming_books/get_books_cubit.dart';
import 'package:bookstore/widgets/book_card.dart';
import 'package:bookstore/widgets/see_all/see_all_upcoming_books.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookuncomingCardListView extends StatefulWidget {
  const BookuncomingCardListView({super.key});

  @override
  State<BookuncomingCardListView> createState() =>
      _BookuncomingCardListViewState();
}

class _BookuncomingCardListViewState extends State<BookuncomingCardListView> {
  @override
  void initState() {
    super.initState();

    context.read<GetupcomingBooksCubit>().getupcomingbooks();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Upcoming Books',
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
                      builder: (context) => const SeeAllUpcomingBooks()),
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
        BlocBuilder<GetupcomingBooksCubit, GetupcomingBooksState>(
          builder: (context, state) {
            if (state is GetupcomingBooksLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            } else if (state is GetupcomingBooksSuccess) {
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
                        category: state.books.book![index].category!,
                        autherName: state.books.book![index].author!,
                        description: state.books.book![index].description!,
                        bookid: state.books.book![index].sId!,
                        rating: 0,
                        price: '',
                      ),
                    );
                  }),
                ),
              );
            } else if (state is GetupcomingBooksFailure) {
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
  }
}
