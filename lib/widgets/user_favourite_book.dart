import 'package:bookstore/constants.dart';
import 'package:bookstore/core/errors/errorbooks.dart';
import 'package:bookstore/cubits/get_books/get_user_fav_books/get_books_cubit.dart';
import 'package:bookstore/widgets/searchcardofbbok.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserFavouriteBooks extends StatefulWidget {
  const UserFavouriteBooks({super.key});

  @override
  State<UserFavouriteBooks> createState() => _UserFavouriteBooksState();
}

class _UserFavouriteBooksState extends State<UserFavouriteBooks> {
  @override
  void initState() {
    super.initState();
    context.read<GetFavoritesBooksCubit>().getFavoritbooks();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Favourite Books',
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
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
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
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              } else {
                return BlocBuilder<GetFavoritesBooksCubit, GetFavoriteState>(
                  builder: (context, state) {
                    if (state is GetFavoriteBooksLoading) {
                      return const Center(
                          child: CircularProgressIndicator(
                        color: Colors.black,
                      ));
                    } else if (state is GetFavoriteBooksSuccess) {
                      return ListView.builder(
                        itemCount: state.books.favorites!.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                right: 12, left: 12, bottom: 12.0),
                            child: SearchCardOfCartBook(
                              image: state.books.favorites![index].image!.url
                                  .toString(),
                              title: state.books.favorites![index].title!,
                              price: state.books.favorites![index].price
                                  .toString(),
                              autherName: state.books.favorites![index].author!,
                              category: state.books.favorites![index].category!,
                              bookid:
                                  state.books.favorites![index].sId!.toString(),
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(child: Text('No Favourite Books'));
                    }
                  },
                );
              }
            } else if (state is GetFavoriteBooksFailure) {
              return const BooksError();
            }
            return const BooksError();
          }),

          // child: FutureBuilder<List<FavBooksModel>>(
          //   future: GetFavBooksServices().getFavBooks(),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       List<FavBooksModel> favBooks = snapshot.data!;
          //       return ListView.builder(
          //         scrollDirection: Axis.vertical,
          //         itemCount: favBooks.length,
          //         itemBuilder: ((context, index) {
          //           return Padding(
          //             padding: const EdgeInsets.only(bottom: 12),
          //             child: SearchCardOfCartBook(
          //               title: favBooks[index].title,
          //               autherName: favBooks[index].author,
          //               bookid: favBooks[index].id,
          //               category: favBooks[index].category,
          //               image: favBooks[index].image.url,
          //               price: favBooks[index].price.toString(),
          //             ),
          //           );
          //         }),
          //       );
          //     } else {
          //       return const Center(child: CircularProgressIndicator());
          //     }
          //   },
          // ),
        ),
      ),
    );
  }
}
