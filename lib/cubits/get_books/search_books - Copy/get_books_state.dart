part of 'get_books_cubit.dart';

@immutable
sealed class GetSearchState {}

final class GetSearchInitial extends GetSearchState {}

final class GetSearchBooksLoading extends GetSearchState {}

final class GetSearchBooksSuccess extends GetSearchState {
   final List<Books> books;

  GetSearchBooksSuccess({required this.books});
}

final class GetSearchBooksFailure extends GetSearchState {
  final String message;

  GetSearchBooksFailure(this.message);
}
