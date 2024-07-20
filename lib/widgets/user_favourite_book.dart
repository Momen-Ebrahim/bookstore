import 'package:bookstore/constants.dart';
import 'package:bookstore/core/errors/errorbooks.dart';
import 'package:bookstore/cubits/get_books/get_user_fav_books/get_books_cubit.dart';
import 'package:bookstore/cubits/get_books/get_user_own__books/get_books_cubit.dart';
import 'package:bookstore/generated/l10n.dart';
import 'package:bookstore/widgets/custom_loading_big_card.dart';
import 'package:bookstore/widgets/searchcardofbbok.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserFavouriteBooks extends StatefulWidget {
  const UserFavouriteBooks({super.key});

  @override
  State<UserFavouriteBooks> createState() => _UserFavouriteBooksState();
}

class _UserFavouriteBooksState extends State<UserFavouriteBooks> {
  final Map<String, bool> ownedBooks = {};

  @override
  void initState() {
    super.initState();
    context.read<GetFavoritesBooksCubit>().getFavoritbooks();
    context.read<GetownBooksCubit>().getownBooks();
  }

  bool ownershipCheckComplete = false;
  void checkIfOwned(String bookId) {
    final ownBooksState = context.read<GetownBooksCubit>().state;

    if (ownBooksState is GetownBooksSuccess) {
      final ownBooks = ownBooksState.books.books!;

      for (var book in ownBooks) {
        if (book.sId == bookId) {
          ownedBooks[bookId] = true;
          ownershipCheckComplete = true;
          return;
        }
      }
      ownedBooks[bookId] = false;
      ownershipCheckComplete = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).FavouriteBooks,
            style: TextStyle(
              color: Colors.black,
              fontSize: getResponsiveFontSize(context, fontSize: 24),
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: BlocBuilder<GetFavoritesBooksCubit, GetFavoriteState>(
            builder: (context, state) {
              if (state is GetFavoriteBooksLoading) {
                return const CustomLoadingBigCard();
              } else if (state is GetFavoriteBooksSuccess) {
                if (state.books.favorites!.isEmpty) {
                  return Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        Image.asset(
                          'assets/images/emptyfavouritebook.png',
                          height: 300,
                          width: 300,
                        ),
                        Text(
                          'No Favourite Books',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize:
                                getResponsiveFontSize(context, fontSize: 25),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: state.books.favorites!.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final favoriteBook = state.books.favorites![index];
                      if (!ownedBooks.containsKey(favoriteBook.sId)) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          checkIfOwned(favoriteBook.sId!);
                          setState(() {});
                        });
                      }
                      final isOwned = ownedBooks[favoriteBook.sId] ?? false;

                      return Padding(
                        padding: const EdgeInsets.only(
                          right: 12,
                          left: 12,
                          bottom: 12.0,
                        ),
                        child: Column(
                          children: [
                            if (ownershipCheckComplete)
                              SearchCardOfCartBook(
                                rate: favoriteBook.averageRating.toDouble(),
                                image: favoriteBook.image!.url.toString(),
                                title: favoriteBook.title!,
                                price: isOwned
                                    ? 'Owned'
                                    : favoriteBook.onsale!
                                        ? favoriteBook.saleprice!.toString()
                                        : favoriteBook.price!.toString(),
                                category: favoriteBook.category!,
                                autherName: favoriteBook.author!,
                                bookid: favoriteBook.sId!.toString(),
                              )
                            else
                              Container(),
                          ],
                        ),
                      );
                    },
                  );
                }
              } else if (state is GetFavoriteBooksFailure) {
                return const BooksError();
              } else {
                return const BooksError();
              }
            },
          ),
        ),
      ),
    );
  }
}
