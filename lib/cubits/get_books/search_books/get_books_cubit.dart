import 'package:bloc/bloc.dart';
import 'package:bookstore/core/repo/books_repo/search_repo%20-%20Copy.dart';
import 'package:bookstore/models/book_model/Category_model.dart';

import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'get_books_state.dart';

class GetsearchBooksCubit extends Cubit<GetSearchState> {
  GetsearchBooksCubit() : super(GetSearchInitial());
  GetSearchBooksRepo booksRepo = GetSearchBooksRepo();
  getsearchbooks(String search , String fliter) async {
    emit(GetSearchBooksLoading());
    try {
      await booksRepo.getCategoryBooks(search , fliter).then((books) {
        if (books != null) {
          emit(GetSearchBooksSuccess(books: books));
        } else {
          emit(GetSearchBooksFailure('Failed to load books'));
        }
      });
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      emit(GetSearchBooksFailure('Failed to load books'));
    }
    // final books = GetBooksRepo().getBooks();
    // if (books != null) {
    //   emit(GetBooksSuccess(books));
    // } else {
    //   emit(GetBooksFailure('Failed to load books'));
    // }
  }
}
