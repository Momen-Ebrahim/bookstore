part of 'get_books_cubit.dart';

@immutable
sealed class GetCategoryState {}

final class GetCategorylInitial extends GetCategoryState {}

final class GetCategoryBooksLoading extends GetCategoryState {}

final class GetCategoryBooksSuccess extends GetCategoryState {
  final Category_model books;

  GetCategoryBooksSuccess({required this.books});
}

final class GetCategoryBooksFailure extends GetCategoryState {
  final String message;

  GetCategoryBooksFailure(this.message);
}
