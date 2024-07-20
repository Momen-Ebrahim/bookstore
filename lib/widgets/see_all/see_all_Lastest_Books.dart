import 'package:bookstore/core/errors/errorbooks.dart';
import 'package:bookstore/cubits/get_books/get_newarrival_books/get_books_cubit.dart';
import 'package:bookstore/generated/l10n.dart';
import 'package:bookstore/widgets/custom_loading_big_card.dart';
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
        title: Text(
          S.of(context).NewArrivals,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 32, left: 12, right: 12),
        child: BlocBuilder<GetnewarrivalBooksCubit, GearrivalBooksState>(
          builder: (context, state) {
            if (state is GetnewarrivalBooksLoading) {
              return const CustomLoadingBigCard();
            } else if (state is GetnewarrivalBooksSuccess) {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: state.books.book!.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: SearchCardOfCartBook(
                      rate: state.books.book![index].averageRating!.toDouble(),
                      image: state.books.book![index].image!.url.toString(),
                      title: state.books.book![index].title!,
                      price: state.books.book![index].onsale!
                          ? state.books.book![index].saleprice!.toString()
                          : state.books.book![index].price!.toString(),
                      category: state.books.book![index].category!,
                      autherName: state.books.book![index].author!,
                      bookid: state.books.book![index].sId!,
                    ),
                  );
                }),
              );
            } else if (state is GetnewarrivalBooksFailure) {
              return const BooksError();
            }
            return const BooksError();
          },
        ),
      ),
    );
  }
}
