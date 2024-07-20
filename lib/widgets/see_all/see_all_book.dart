import 'package:bookstore/core/errors/errorbooks.dart';
import 'package:bookstore/cubits/get_books/get_books/get_books_cubit.dart';
import 'package:bookstore/generated/l10n.dart';
import 'package:bookstore/widgets/custom_loading_big_card.dart';
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
        title: Text(
          S.of(context).AllBooks,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 32, left: 12, right: 12),
        child: BlocBuilder<GetallBooksCubit, GetbookState>(
          builder: (context, state) {
            if (state is GetBooksLoading) {
              return const CustomLoadingBigCard();
            } else if (state is GetbooksSuccess) {
              return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: state.books.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: SearchCardOfCartBook(
                      rate: state.books[index].averageRating!.toDouble(),
                      image: state.books[index].image!.url.toString(),
                      title: state.books[index].title!,
                      price: state.books[index].onsale!
                          ? state.books[index].saleprice!.toString()
                          : state.books[index].price!.toString(),
                      category: state.books[index].category!,
                      autherName: state.books[index].author!,
                      bookid: state.books[index].sId!,
                    ),
                  );
                }),
              );
            } else if (state is GetBooksFailure) {
              return const BooksError();
            }
            return const BooksError();
          },
        ),
      ),
    );
  }
}
