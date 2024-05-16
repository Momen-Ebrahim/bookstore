import 'package:bloc/bloc.dart';
import 'package:bookstore/core/repo/books_repo/get_user_fav_repo%20-%20.dart';
import 'package:bookstore/models/fav_book_model.dart';

import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'get_books_state.dart';

class GetFavoritesBooksCubit extends Cubit<GetFavoriteState> {
  GetFavoritesBooksCubit() : super(GetFavoritelInitial());
  GetfavoritesBooksRepo booksRepo = GetfavoritesBooksRepo();
  getFavoritbooks() async {
    emit(GetFavoriteBooksLoading());
    try {
      await booksRepo.getfavoritesBooks().then((books) {
        if (books != null) {
          emit(GetFavoriteBooksSuccess(books: books));
        } else {
          emit(GetFavoriteBooksFailure('Failed to load books'));
        }
      });
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      emit(GetFavoriteBooksFailure('Failed to load books'));
    }
    // final books = GetBooksRepo().getBooks();
    // if (books != null) {
    //   emit(GetBooksSuccess(books));
    // } else {
    //   emit(GetBooksFailure('Failed to load books'));
    // }
  }
}
