import 'package:bloc/bloc.dart';
import 'package:bookstore/helper/local_network.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Add this import for jsonEncode

part 'update_user_profile_state.dart';

class UpdateUserProfileCubit extends Cubit<UpdateUserProfileState> {
  UpdateUserProfileCubit() : super(UpdateUserProfileInitial());

  GlobalKey<FormState> editFormKey = GlobalKey();
  TextEditingController editFirstName = TextEditingController();
  TextEditingController editLastName = TextEditingController();
  TextEditingController editUserName = TextEditingController();
  TextEditingController editEmail = TextEditingController();

  Future<void> updateUserProfile() async {
    final url = Uri.parse('https://book-store-api-mu.vercel.app/User/Edit');

    final Map<String, dynamic> body = {};
    if (editFirstName.text.isNotEmpty) {
      body['firstname'] = editFirstName.text;
    }
    if (editLastName.text.isNotEmpty) {
      body['lastname'] = editLastName.text;
    }
    if (editUserName.text.isNotEmpty) {
      body['username'] = editUserName.text;
    }

    try {
      emit(UpdateUserProfileLoading());
      final response = await http.put(
        url,
        headers: {
          'Authorization': 'Bearer ${CacheNetwork.getCacheData(key: 'token')}',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        emit(UpdateUserProfileSuccess());
      } else {
        // The request failed
        print(
            'Failed to update user profile. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        emit(UpdateUserProfileFailure());
      }
    } catch (error) {
      print('An error occurred: $error');
      emit(UpdateUserProfileFailure());
    }
  }
}
