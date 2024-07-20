import 'package:bookstore/core/errors/errorbooks.dart';
import 'package:bookstore/cubits/get_books/get_topseller%20-books/get_books_cubit.dart';
import 'package:bookstore/generated/l10n.dart';
import 'package:bookstore/widgets/custom_loading_big_card.dart';
import 'package:bookstore/widgets/searchcardofbbok.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeeAllTopBooks extends StatefulWidget {
  const SeeAllTopBooks({
    super.key,
  });

  @override
  State<SeeAllTopBooks> createState() => _SeeAllTopBooksState();
}

class _SeeAllTopBooksState extends State<SeeAllTopBooks> {
  @override
  void initState() {
    super.initState();
    context.read<GettopsellerBooksCubit>().gettopsellerbooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).BestSeller,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 32, left: 12, right: 12),
        child: BlocBuilder<GettopsellerBooksCubit, GettopsellerBooksstate>(
          builder: (context, state) {
            if (state is GettopsellerBooksLoading) {
              return const CustomLoadingBigCard();
            } else if (state is GettopsellerBooksSuccess) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 1,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: state.books.book!.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: SearchCardOfCartBook(
                        rate:
                            state.books.book![index].averageRating!.toDouble(),
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
                ),
              );
            } else if (state is GettopsellerBooksFailure) {
              return const BooksError();
            }
            return const BooksError();
          },
        ),
      ),
    );
  }
}
