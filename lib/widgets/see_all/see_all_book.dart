import 'package:bookstore/cubits/get_books/get_books/get_books_cubit.dart';
import 'package:bookstore/widgets/searchcardofbbok.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeeAllBooks extends StatefulWidget {
  const SeeAllBooks({
    super.key,
  });

  @override
  State<SeeAllBooks> createState() => _SeeAllBooksState();
}

class _SeeAllBooksState extends State<SeeAllBooks> {
  @override
  void initState() {
    super.initState();
    context.read<GetallBooksCubit>().getbooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'All Books',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<GetallBooksCubit, GetbookState>(
                builder: (context, state) {
                  if (state is GetBooksLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    );
                  } else if (state is GetbooksSuccess) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 1,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: state.books.length,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: SearchCardOfCartBook(
                              image: state.books[index].image!.url.toString(),
                              title: state.books[index].title!,
                              price: state.books[index].price!.toString(),
                              category: state.books[index].category!,
                              autherName: state.books[index].author!,
                               bookid: state.books[index].sId!,
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
          ),
        ),
      ),
    );
  }
}
