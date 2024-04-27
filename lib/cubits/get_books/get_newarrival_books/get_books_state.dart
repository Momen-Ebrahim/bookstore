part of 'get_books_cubit.dart';

@immutable
sealed class  GearrivalBooksState {}

final class GetBooksnewarrivalInitial extends  GearrivalBooksState {}

final class GetnewarrivalBooksLoading extends  GearrivalBooksState {}

final class GetnewarrivalBooksSuccess extends  GearrivalBooksState {
  final Books books;

  GetnewarrivalBooksSuccess({required this.books});
}

final class GetnewarrivalBooksFailure extends  GearrivalBooksState {
  final String message;

  GetnewarrivalBooksFailure(this.message);
}
