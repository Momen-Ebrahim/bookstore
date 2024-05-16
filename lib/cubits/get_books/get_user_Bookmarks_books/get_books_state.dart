part of 'get_books_cubit.dart';

@immutable
sealed class GetBookmarkseState {}

final class GetmarkselInitial extends GetBookmarkseState {}

final class GetmarkseBooksLoading extends GetBookmarkseState {}

final class GetmarkseBooksSuccess extends GetBookmarkseState {
  final UserBookmarks books;

  GetmarkseBooksSuccess({required this.books});
}

final class GetmarkseBooksFailure extends GetBookmarkseState {
  final String message;

  GetmarkseBooksFailure(this.message);
}
