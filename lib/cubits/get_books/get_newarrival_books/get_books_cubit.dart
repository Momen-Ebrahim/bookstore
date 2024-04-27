import 'package:bloc/bloc.dart';
import 'package:bookstore/core/repo/books_repo/get_newarrival_books_repo%20-%20Copy%20(3).dart';
import 'package:bookstore/models/books.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'get_books_state.dart';

class  GetnewarrivalBooksCubit extends Cubit<GearrivalBooksState> {
   GetnewarrivalBooksCubit() : super(GetBooksnewarrivalInitial());
  GetnewarrivalBooksRepo booksRepo = GetnewarrivalBooksRepo();
  getnewarrivalbooks() async {
    emit(GetnewarrivalBooksLoading());
    try {
      await booksRepo.getnewarrivalBooks().then((books) {
        if (books != null) {
          emit(GetnewarrivalBooksSuccess(books: books));
        } else {
          emit(GetnewarrivalBooksFailure('Failed to load books'));
        }
      });
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      emit(GetnewarrivalBooksFailure('Failed to load books'));
    }
    // final books = GetBooksRepo().getBooks();
    // if (books != null) {
    //   emit(GetBooksSuccess(books));
    // } else {
    //   emit(GetBooksFailure('Failed to load books'));
    // }
  }
}
