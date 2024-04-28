part of 'get_books_cubit.dart';

@immutable
sealed class GetbookState {}

final class GetbooksInitial extends GetbookState {}

final class GetBooksLoading extends GetbookState {}

final class GetbooksSuccess extends GetbookState {
   final List<Books> books;

  GetbooksSuccess({required this.books});
}

final class GetBooksFailure extends GetbookState {
  final String message;

  GetBooksFailure(this.message);
}
