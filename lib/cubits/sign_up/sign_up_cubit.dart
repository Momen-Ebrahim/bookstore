import 'package:bloc/bloc.dart';
import 'package:bookstore/helper/api.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  //Sign up FirstName
  TextEditingController signUpFirstName = TextEditingController();
  //Sign up Last Name
  TextEditingController signUpLastName = TextEditingController();
  //Sign up email
  TextEditingController signUpEmail = TextEditingController();
  //Sign up password
  TextEditingController signUpPassword = TextEditingController();
  //Sign up UserName
  TextEditingController signUpUserName = TextEditingController();

  signUp() async {
    try {
      emit(SignUpLoading());
      Api().post(
          url: 'https://book-store-api-mu.vercel.app/User/Register',
          body: {
            'firstname': signUpFirstName.text,
            'lastname': signUpLastName.text,
            'username': signUpUserName.text,
            'email': signUpEmail.text,
            'password': signUpPassword.text,
          });
      emit(SignUpSuccess());
    } catch (e) {
      emit(
        SignUpFailure(errMessage: e.toString()),
      );
    }
  }
}
