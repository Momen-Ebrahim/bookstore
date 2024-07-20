import 'package:bookstore/core/errors/errorbooks.dart';
import 'package:bookstore/cubits/get_books/get_Category_books/get_books_cubit.dart';
import 'package:bookstore/cubits/get_books/get_user_own__books/get_books_cubit.dart';
import 'package:bookstore/widgets/book_card.dart';
import 'package:bookstore/widgets/custom_loading_small_card_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookCardOfCategoryGridView extends StatefulWidget {
  const BookCardOfCategoryGridView({super.key, required this.categoryName});
  final String categoryName;

  @override
  State<BookCardOfCategoryGridView> createState() =>
      _BookCardOfCategoryGridViewState();
}

class _BookCardOfCategoryGridViewState
    extends State<BookCardOfCategoryGridView> {
  @override
  void initState() {
    super.initState();
    context.read<GetCategoryBooksCubit>().getCategorybooks(widget.categoryName);
    context.read<GetownBooksCubit>().getownBooks();
  }

  bool ownershipCheckComplete = false;
  final Map<String, bool> ownedBooks = {};

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
    return BlocBuilder<GetCategoryBooksCubit, GetCategoryState>(
      builder: (context, state) {
        if (state is GetCategoryBooksLoading) {
          return const CustomLoadingSmallCardGridView();
        } else if (state is GetCategoryBooksSuccess) {
          return Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: .5,
              ),
              itemCount: state.books.books!.length,
              itemBuilder: (BuildContext context, int index) {
                final favoriteBook = state.books.books![index];
                if (!ownedBooks.containsKey(favoriteBook.sId)) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    checkIfOwned(favoriteBook.sId!);
                    setState(() {});
                  });
                }
                final isOwned = ownedBooks[favoriteBook.sId] ?? false;
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: (ownershipCheckComplete)
                      ? BookCard(
                          category: state.books.books![index].category!,
                          title: state.books.books![index].title!,
                          autherName: state.books.books![index].author!,
                          price: isOwned
                              ? 'Owned'
                              : state.books.books![index].onsale!
                                  ? state.books.books![index].saleprice!
                                      .toString()
                                  : state.books.books![index].price!.toString(),
                          rating: state.books.books![index].averageRating
                              .toDouble(),
                          description: state.books.books![index].description!,
                          image:
                              state.books.books![index].image!.url.toString(),
                          bookid: state.books.books![index].sId!,
                        )
                      : Container(),
                );
              },
            ),
          );
        } else {
          return const BooksError();
        }
      },
    );
  }
}
