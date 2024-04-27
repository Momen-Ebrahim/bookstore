part of 'get_books_cubit.dart';

@immutable
sealed class GetBooksState {}

final class GetBooksInitial extends GetBooksState {}

final class GetBooksLoading extends GetBooksState {}

final class GetBooksSuccess extends GetBooksState {
  final List<Books> books;

  GetBooksSuccess({required this.books});
}

final class GetBooksFailure extends GetBooksState {
  final String message;

  GetBooksFailure(this.message);
}
