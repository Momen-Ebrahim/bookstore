import 'dart:convert';

import 'package:bookstore/models/books.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class GettopsellerBooksRepo {
  Future<Books?> gettopsellerBooks() async {
    try {
     
      final url =
          Uri.parse('https://book-store-api-mu.vercel.app/Books/topseller');
    
      var response = await http.get(url);
      var decodedResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        Books resonse = Books.fromJson(decodedResponse);
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
