import 'dart:convert';

import 'package:bookstore/models/books.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class GetBooksRepo {
  Future<List<Books>?> getBooks() async {
    try {
  final url = Uri.parse('https://book-store-api-mu.vercel.app/Books/');
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
