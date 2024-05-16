import 'package:bloc/bloc.dart';
import 'package:bookstore/helper/api.dart';
import 'package:bookstore/helper/local_network.dart';
import 'package:meta/meta.dart';

part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit() : super(AddToCartInitial());

  addToCart({required String bookid}) async {
    try {
      emit(AddToCartLoading());
      final response = await Api().post(
        token: CacheNetwork.getCacheData(key: 'token'),
        url: 'https://book-store-api-mu.vercel.app/User/Bookmarks/$bookid',
      );
      emit(AddToCartSuccess());
    } catch (e) {
      emit(AddToCartFailure(errMeassage: e.toString()));
    }
  }
}
