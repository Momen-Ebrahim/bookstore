import 'package:bloc/bloc.dart';
import 'package:bookstore/core/repo/books_repo/get_user_bookmarks_repo%20.dart';
import 'package:bookstore/models/user_bookmarks_model.dart';

import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'get_books_state.dart';

class GetmarksBooksCubit extends Cubit<GetBookmarkseState> {
  GetmarksBooksCubit() : super(GetmarkselInitial());
  GetBookmarksBooksRepo booksRepo = GetBookmarksBooksRepo();
  getmarksbooks() async {
    emit(GetmarkseBooksLoading());
    try {
      await booksRepo.getBookmarksBooks().then((books) {
        if (books != null) {
          emit(GetmarkseBooksSuccess(books: books));
        } else {
          emit(GetmarkseBooksFailure('Failed to load books'));
        }
      });
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      emit(GetmarkseBooksFailure('Failed to load books'));
    }
    // final books = GetBooksRepo().getBooks();
    // if (books != null) {
    //   emit(GetBooksSuccess(books));
    // } else {
    //   emit(GetBooksFailure('Failed to load books'));
    // }
  }
}
