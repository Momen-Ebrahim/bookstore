import 'package:bloc/bloc.dart';
import 'package:bookstore/core/repo/books_repo/get_category_repo.dart';
import 'package:bookstore/models/book_model/Category_model.dart';

import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'get_books_state.dart';

class GetCategoryBooksCubit extends Cubit<GetCategoryState> {
  GetCategoryBooksCubit() : super(GetCategorylInitial());
  GetCategoryBooksRepo booksRepo = GetCategoryBooksRepo();
  getCategorybooks(String categorykey) async {
    emit(GetCategoryBooksLoading());
    try {
      await booksRepo.getCategoryBooks(categorykey).then((books) {
        if (books != null) {
          emit(GetCategoryBooksSuccess(books: books));
        } else {
          emit(GetCategoryBooksFailure('Failed to load books'));
        }
      });
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      emit(GetCategoryBooksFailure('Failed to load books'));
    }
    // final books = GetBooksRepo().getBooks();
    // if (books != null) {
    //   emit(GetBooksSuccess(books));
    // } else {
    //   emit(GetBooksFailure('Failed to load books'));
    // }
  }
}
