part of 'get_books_cubit.dart';

@immutable
sealed class GeBooksidtate {}

final class GetBookidInitial extends GeBooksidtate {}

final class GeBookidLoading extends GeBooksidtate {}

final class GetBookidSuccess extends GeBooksidtate {
  final Bookid books;

  GetBookidSuccess({required this.books});
}

final class GetBookidFailure extends GeBooksidtate {
  final String message;

  GetBookidFailure(this.message);
}
