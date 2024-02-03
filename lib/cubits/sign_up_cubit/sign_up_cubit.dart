import 'package:bloc/bloc.dart';
import 'package:bookstore/constants.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  signUpUser() {
    emit(
      SignUpUser(
          adminColor: const Color.fromARGB(15, 255, 255, 255),
          userColor: kPrimerycolor),
    );
  }

  signUpAdmin() {
    emit(
      SignUpAdmin(
        adminColor: kPrimerycolor,
        userColor: const Color.fromARGB(15, 255, 255, 255),
      ),
    );
  }
}
