import 'dart:convert';

import 'package:bookstore/models/book_model/Category_model.dart';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class GetCategoryBooksRepo {
  Future<Category_model?> getCategoryBooks(String categorykey) async {
    try {
      final url = Uri.parse(
          'https://book-store-api-mu.vercel.app/Books/categories/$categorykey');
      if (kDebugMode) {
        print(url);
      }
      var response = await http.get(url);
      var decodedResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        Category_model resonse = Category_model.fromJson(decodedResponse);
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
