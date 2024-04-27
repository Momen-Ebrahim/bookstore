import 'package:bloc/bloc.dart';
import 'package:bookstore/core/repo/books_repo/get_onsale_books_repo%20-%20Copy%20(2).dart';
import 'package:bookstore/models/books.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'get_books_state.dart';

class GetonsaleBooksCubit extends Cubit<GetonsaleBooksState> {
  GetonsaleBooksCubit() : super(GetonsaleBooksInitial());
  GetonsaleBooksRepo  booksRepo = GetonsaleBooksRepo();
  getonsalebooks() async {
    emit(GetonsaleBooksLoading());
    try {
      await booksRepo.getonsaleBooks().then((books) {
        if (books != null) {
          emit(GetonsaleBooksSuccess(books: books));
        } else {
          emit(GetonsaleBooksFailure('Failed to load books'));
        }
      });
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      emit(GetonsaleBooksFailure('Failed to load books'));
    }
    // final books = GetBooksRepo().getBooks();
    // if (books != null) {
    //   emit(GetBooksSuccess(books));
    // } else {
    //   emit(GetBooksFailure('Failed to load books'));
    // }
  }
}
