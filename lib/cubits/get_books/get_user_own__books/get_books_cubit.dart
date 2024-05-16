import 'package:bloc/bloc.dart';
import 'package:bookstore/core/repo/books_repo/get_user_own_book_repo.dart';
import 'package:bookstore/models/user_own_books_model.dart';

import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'get_books_state.dart';

class GetownBooksCubit extends Cubit<GetownBooksState> {
  GetownBooksCubit() : super(GetownBookslInitial());
  GetownBooksRepo booksRepo = GetownBooksRepo();
  getownBooks() async {
    emit(GetownBooksLoading());
    try {
      await booksRepo.getownBooks().then((books) {
        if (books != null) {
          emit(GetownBooksSuccess(books: books));
        } else {
          emit(GetownBooksFailure('Failed to load books'));
        }
      });
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      emit(GetownBooksFailure('Failed to load books'));
    }
    // final books = GetBooksRepo().getBooks();
    // if (books != null) {
    //   emit(GetBooksSuccess(books));
    // } else {
    //   emit(GetBooksFailure('Failed to load books'));
    // }
  }
}
