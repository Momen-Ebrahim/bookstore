import 'package:bloc/bloc.dart';
import 'package:bookstore/core/repo/get_books_repo.dart';
import 'package:bookstore/models/books.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'get_books_state.dart';

class GetBooksCubit extends Cubit<GetBooksState> {
  GetBooksCubit() : super(GetBooksInitial());
  GetBooksRepo booksRepo = GetBooksRepo();
  getbooks( ) async {
    emit(GetBooksLoading());
    try {
      await booksRepo.getBooks().then((books) {
        if (books != null) {
          emit(GetBooksSuccess(books: books));
        } else {
          emit(GetBooksFailure('Failed to load books'));
        }
      });
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      emit(GetBooksFailure('Failed to load books'));
    }
    // final books = GetBooksRepo().getBooks();
    // if (books != null) {
    //   emit(GetBooksSuccess(books));
    // } else {
    //   emit(GetBooksFailure('Failed to load books'));
    // }
  }
}
