import 'package:bloc/bloc.dart';
import 'package:bookstore/core/repo/books_repo/get_upcoming_books_repo.dart';
import 'package:bookstore/models/uncomingbooks.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'get_books_state.dart';

class  GetupcomingBooksCubit extends Cubit<GetupcomingBooksState> {
   GetupcomingBooksCubit() : super(GetupcomingBooksInitial());
  GetupcomingBooksRepo booksRepo = GetupcomingBooksRepo();
  getupcomingbooks() async {
    emit(GetupcomingBooksLoading());
    try {
      await booksRepo.getupcomingBooks().then((books) {
        if (books != null) {
          emit(GetupcomingBooksSuccess(books: books));
        } else {
          emit(GetupcomingBooksFailure('Failed to load books'));
        }
      });
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      emit(GetupcomingBooksFailure('Failed to load books'));
    }
    // final books = GetBooksRepo().getBooks();
    // if (books != null) {
    //   emit(GetBooksSuccess(books));
    // } else {
    //   emit(GetBooksFailure('Failed to load books'));
    // }
  }
}
