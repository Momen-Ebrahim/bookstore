part of 'get_books_cubit.dart';

@immutable
sealed class GetFavoriteState {}

final class GetFavoritelInitial extends GetFavoriteState {}

final class GetFavoriteBooksLoading extends GetFavoriteState {}

final class GetFavoriteBooksSuccess extends GetFavoriteState {
  final favbooks books;

  GetFavoriteBooksSuccess({required this.books});
}

final class GetFavoriteBooksFailure extends GetFavoriteState {
  final String message;

  GetFavoriteBooksFailure(this.message);
}
