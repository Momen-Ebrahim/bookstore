import 'package:bloc/bloc.dart';
import 'package:bookstore/core/repo/get_user_info_rebo.dart';
import 'package:bookstore/helper/local_network.dart';
import 'package:bookstore/models/get_user_info_model.dart';
import 'package:meta/meta.dart';

part 'get_user_info_state.dart';

class GetUserInfoCubit extends Cubit<GetUserInfoState> {
  GetUserInfoCubit() : super(GetUserInfoInitial());
  GetUserInfoRepo getUserInfoRepo = GetUserInfoRepo();
  getUserInfo() async {
    emit(GetUserInfoLoading());
    try {
      await getUserInfoRepo
          .getUserInfo(
        token: CacheNetwork.getCacheData(key: 'token'),
      )
          .then(
        (value) {
          if (value != null) {
            emit(
              GetUserInfoSuccess(response: value),
            );
          } else {
            emit(GetUserInfoFailure());
          }
        },
      );
    } catch (e) {
      emit(GetUserInfoFailure());
    }
  }
}
