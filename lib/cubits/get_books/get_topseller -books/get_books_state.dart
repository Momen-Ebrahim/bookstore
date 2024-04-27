part of 'get_books_cubit.dart';

@immutable
sealed class GettopsellerBooksstate {}

final class GettopsellerBooksInitial extends GettopsellerBooksstate {}

final class GettopsellerBooksLoading extends GettopsellerBooksstate {}

final class GettopsellerBooksSuccess extends GettopsellerBooksstate {
  final Books books;

  GettopsellerBooksSuccess({required this.books});
}

final class GettopsellerBooksFailure extends GettopsellerBooksstate {
  final String message;

  GettopsellerBooksFailure(this.message);
}
