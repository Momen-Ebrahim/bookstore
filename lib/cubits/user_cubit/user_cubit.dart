import 'package:bloc/bloc.dart';
import 'package:bookstore/cache/cache_helper.dart';
import 'package:bookstore/core/api/api_consumer.dart';
import 'package:bookstore/core/api/end_ponits.dart';
import 'package:bookstore/core/errors/exceptions.dart';
import 'package:bookstore/core/services/service_locator.dart';
import 'package:bookstore/models/sign_in_model.dart';
import 'package:bookstore/models/sign_up_model.dart';
import 'package:bookstore/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.api) : super(UserInitial());
  final ApiConsumer api;
  //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();
  //Sign in email
  TextEditingController signInEmail = TextEditingController();
  //Sign in password
  TextEditingController signInPassword = TextEditingController();
  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  //Profile Pic
  XFile? profilePic;
  //Sign up name
  TextEditingController signUpName = TextEditingController();
  //Sign up phone number
  TextEditingController signUpPhoneNumber = TextEditingController();
  //Sign up email
  TextEditingController signUpEmail = TextEditingController();
  //Sign up password
  TextEditingController signUpPassword = TextEditingController();
  //Sign up confirm password
  TextEditingController confirmPassword = TextEditingController();
  SignInModel? user;
  signIn() async {
    try {
      emit(
        SignInLoading(),
      );
      final response = await api.post(
        EndPoint.signIn,
        data: {
          ApiKey.email: signInEmail.text,
          ApiKey.password: signInPassword.text,
        },
      );

      user = SignInModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(user!.token);
      getIt<CacheHelper>().saveData(
        key: ApiKey.token,
        value: user!.token,
      );
      getIt<CacheHelper>().saveData(
        key: ApiKey.id,
        value: decodedToken[ApiKey.id],
      );

      emit(
        SignInSuccess(),
      );
    } on ServerException catch (e) {
      emit(
        SignInFailure(errMessage: e.errModel.errorMessage),
      );
    }
  }

  signUp() async {
    try {
      emit(SignUpLoading());
      final response = await api.post(
        EndPoint.signUp,
        isFromData: true,
        data: {
          ApiKey.name: signUpName.text,
          ApiKey.phone: '01271356386',
          ApiKey.email: signUpEmail.text,
          ApiKey.password: signUpPassword.text,
          ApiKey.confirmPassword: confirmPassword.text,
          ApiKey.location:
              '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}',
          ApiKey.profilePic: await uploadProfilePic(profilePic!),
        },
      );
      final signUpModel = SignUpModel.fromJson(response);
      emit(SignUpSuccess(message: signUpModel.message));
    } on ServerException catch (e) {
      emit(
        SignUpFailure(errMessage: e.errModel.errorMessage),
      );
    }
  }

  uploadProfilePic(XFile image) {
    profilePic = image;
    emit(UploadProfilePic());
  }

  getUserProfile() async {
    try {
      emit(GetUserLoading());
      final response = await api.get(
        EndPoint.getUserDataEndPoint(
          CacheHelper().getData(key: ApiKey.id),
        ),
      );
      emit(
        GetUserSuccess(
          user: UserModel.fromJson(response),
        ),
      );
    } on ServerException catch (e) {
      emit(
        GetUserFailure(errMessage: e.errModel.errorMessage),
      );
    }
  }
}
