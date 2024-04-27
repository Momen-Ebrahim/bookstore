import 'dart:convert';

import 'package:bookstore/models/uncomingbooks.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class GetupcomingBooksRepo {
  Future<UpcomingBooks?> getupcomingBooks() async {
    try {
      final url =
          Uri.parse('https://book-store-api-mu.vercel.app/Books/upcoming');

      var response = await http.get(url);
      var decodedResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        UpcomingBooks resonse = UpcomingBooks.fromJson(decodedResponse);
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
