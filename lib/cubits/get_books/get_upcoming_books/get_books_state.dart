part of 'get_books_cubit.dart';

@immutable
sealed class GetupcomingBooksState {}

final class GetupcomingBooksInitial extends GetupcomingBooksState {}

final class GetupcomingBooksLoading extends GetupcomingBooksState {}

final class GetupcomingBooksSuccess extends GetupcomingBooksState {
  final UpcomingBooks books;

  GetupcomingBooksSuccess({required this.books});
}

final class GetupcomingBooksFailure extends GetupcomingBooksState {
  final String message;

  GetupcomingBooksFailure(this.message);
}
