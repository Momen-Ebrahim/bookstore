part of 'get_books_cubit.dart';

@immutable
sealed class GetonsaleBooksState {}

final class GetonsaleBooksInitial extends GetonsaleBooksState {}

final class GetonsaleBooksLoading extends GetonsaleBooksState {}

final class GetonsaleBooksSuccess extends GetonsaleBooksState {
  final Books books;

  GetonsaleBooksSuccess({required this.books});
}

final class GetonsaleBooksFailure extends GetonsaleBooksState {
  final String message;

  GetonsaleBooksFailure(this.message);
}
