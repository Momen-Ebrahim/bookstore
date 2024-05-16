part of 'get_books_cubit.dart';

@immutable
sealed class GetownBooksState {}

final class GetownBookslInitial extends GetownBooksState {}

final class GetownBooksLoading extends GetownBooksState {}

final class GetownBooksSuccess extends GetownBooksState {
  final OwnBooksModel books;

  GetownBooksSuccess({required this.books});
}

final class GetownBooksFailure extends GetownBooksState {
  final String message;

  GetownBooksFailure(this.message);
}
