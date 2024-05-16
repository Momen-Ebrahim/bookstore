import 'dart:convert';
import 'package:bookstore/helper/local_network.dart';
import 'package:bookstore/models/user_own_books_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class GetownBooksRepo {
  Future<OwnBooksModel?> getownBooks() async {
    try {
      final url = Uri.parse('https://book-store-api-mu.vercel.app/User/Books');
      if (kDebugMode) {
        print(url);
      }
      var response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer ${CacheNetwork.getCacheData(key: 'token')}',
        },
      );
      var decodedResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        OwnBooksModel resonse = OwnBooksModel.fromJson(decodedResponse);
        return resonse;
      } else {
        return null;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      return null;
    }
  }
}
