import 'package:bloc/bloc.dart';
import 'package:bookstore/core/repo/books_repo/get_book_id_repo%20-.dart';
import 'package:bookstore/models/book_id_model.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'get_books_state.dart';

class GetBookidCubit extends Cubit<GeBooksidtate> {
  GetBookidCubit() : super(GetBookidInitial());
  GetBookidRepo booksRepo = GetBookidRepo();
  getBookid(String bookid) async {
    emit(GeBookidLoading());
    try {
      await booksRepo.getBookid(bookid).then((books) {
        if (books != null) {
          emit(GetBookidSuccess(books: books));
        } else {
          emit(GetBookidFailure('Failed to load books'));
        }
      });
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      emit(GetBookidFailure('Failed to load books'));
    }
    // final books = GetBooksRepo().getBooks();
    // if (books != null) {
    //   emit(GetBooksSuccess(books));
    // } else {
    //   emit(GetBooksFailure('Failed to load books'));
    // }
  }
}
