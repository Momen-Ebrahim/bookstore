import 'package:bookstore/cubits/get_books/get_upcoming_books/get_books_cubit.dart';
import 'package:bookstore/widgets/searchcardofbbok.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeeAllUpcomingBooks extends StatefulWidget {
  const SeeAllUpcomingBooks({
    super.key,
  });

  @override
  State<SeeAllUpcomingBooks> createState() => _SeeAllUpcomingBooksState();
}

class _SeeAllUpcomingBooksState extends State<SeeAllUpcomingBooks> {
  @override
  void initState() {
    super.initState();
    context.read<GetupcomingBooksCubit>().getupcomingbooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Upcoming Books',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 32, left: 12, right: 12),
        child: BlocBuilder<GetupcomingBooksCubit, GetupcomingBooksState>(
          builder: (context, state) {
            if (state is GetupcomingBooksLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            } else if (state is GetupcomingBooksSuccess) {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: state.books.book!.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: SearchCardOfCartBook(
                      image: state.books.book![index].image!.url.toString(),
                      title: state.books.book![index].title!,
                      price: '',
                      category: state.books.book![index].category!,
                      autherName: state.books.book![index].author!,
                      bookid: state.books.book![index].sId!,
                    ),
                  );
                }),
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
      ),
    );
  }
}
