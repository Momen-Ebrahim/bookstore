import 'package:bloc/bloc.dart';
import 'package:bookstore/helper/api.dart';
import 'package:bookstore/helper/local_network.dart';
import 'package:bookstore/models/sign_in_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  GlobalKey<FormState> signInFormKey = GlobalKey();
  //Sign in email
  TextEditingController signInEmail = TextEditingController();
  //Sign in password
  TextEditingController signInPassword = TextEditingController();

  Future<void> signIn() async {
    try {
      emit(SignInLoading());
      final response = await Api().post(
        token: CacheNetwork.getCacheData(key: 'token'),
        url: 'https://book-store-api-mu.vercel.app/User/Login',
        body: {
          'username': signInEmail.text,
          'password': signInPassword.text,
        },
      );

      // Parse the response body
      // final jsonData = jsonDecode(response.body);
      final signInModel = SignInModel.fromJson(response['UserInformation']);
      await CacheNetwork.insertToCache(key: "token", value: response['token']);
      emit(
        SignInSuccess(signInModel: signInModel),
      );
    } catch (e) {
      emit(SignInFailure(errMessage: e.toString()));
    }
  }
}
