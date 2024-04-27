import 'dart:convert';

import 'package:bookstore/models/book_model/Category_model.dart';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class GetSearchBooksRepo {
  Future<List<Books>?> getCategoryBooks(String search) async {
    try {
      final url = Uri.parse(
          'https://book-store-api-mu.vercel.app/Books?search=$search');
      if (kDebugMode) {
        print(url);
      }
      var response = await http.get(url);
      var decodedResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final respose = (decodedResponse as List<dynamic>)
            .map((book) => Books.fromJson(book))
            .toList();
        return respose;
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
