import 'package:bookstore/cubits/get_books/get_newarrival_books/get_books_cubit.dart';
import 'package:bookstore/widgets/searchcardofbbok.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeeAllLastestBooks extends StatefulWidget {
  const SeeAllLastestBooks({
    super.key,
  });

  @override
  State<SeeAllLastestBooks> createState() => _SeeAllLastestBooksState();
}

class _SeeAllLastestBooksState extends State<SeeAllLastestBooks> {
  @override
  void initState() {
    super.initState();
    context.read<GetnewarrivalBooksCubit>().getnewarrivalbooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lastest Books',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
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
                      scrollDirection: Axis.vertical,
                      itemCount: state.books.book!.length,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: SearchCardOfCartBook(
                            image:
                                state.books.book![index].image!.url.toString(),
                            title: state.books.book![index].title!,
                            price: state.books.book![index].price!.toString(),
                            category: state.books.book![index].category!,
                            autherName: state.books.book![index].author!,
                             bookid: state.books.book![index].sId!,
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
        ),
      ),
    );
  }
}
