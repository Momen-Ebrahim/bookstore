import 'package:bloc/bloc.dart';
import 'package:bookstore/core/repo/books_repo/get_topseller_books_repo%20-%20Copy.dart';
import 'package:bookstore/models/books.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'get_books_state.dart';

class GettopsellerBooksCubit extends Cubit<GettopsellerBooksstate> {
  GettopsellerBooksCubit() : super(GettopsellerBooksInitial());
  GettopsellerBooksRepo booksRepo = GettopsellerBooksRepo();
  gettopsellerbooks() async {
    emit(GettopsellerBooksLoading());
    try {
      await booksRepo.gettopsellerBooks().then((books) {
        if (books != null) {
          emit(GettopsellerBooksSuccess(books: books));
        } else {
          emit(GettopsellerBooksFailure('Failed to load books'));
        }
      });
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      emit(GettopsellerBooksFailure('Failed to load books'));
    }
    // final books = GetBooksRepo().getBooks();
    // if (books != null) {
    //   emit(GetBooksSuccess(books));
    // } else {
    //   emit(GetBooksFailure('Failed to load books'));
    // }
  }
}
