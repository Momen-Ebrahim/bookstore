// import 'package:bloc/bloc.dart';
// import 'package:bookstore/constants.dart';
// import 'package:bookstore/helper/api.dart';
// import 'package:bookstore/models/fav_books_model.dart';
// import 'package:meta/meta.dart';

// part 'fav_book_state.dart';

// class FavBookCubit extends Cubit<FavBookState> {
//   FavBookCubit() : super(FavBookInitial());

//   getFavBooks() async {
//     try {
//       emit(FavBookLoading());
//       final response = await Api().get(
//           url: 'https://book-store-api-mu.vercel.app/User/Favorites',
//           token: kToken);
//       final favBooks = FavBooks.fromJson(response['favorites']);
//       emit(
//         FavBookSuccess(favBooks: favBooks),
//       );
//       print("the fav Books is $favBooks");
//     } catch (e) {
//       emit(
//         FavBookFailure(
//           errMessage: e.toString(),
//         ),
//       );
//     }
//   }
// }
