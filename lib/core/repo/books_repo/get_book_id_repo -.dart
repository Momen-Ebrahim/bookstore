import 'dart:convert';

import 'package:bookstore/models/book_id_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class GetBookidRepo {
  Future<Bookid?> getBookid(String bookid) async {
    try {
      final url =
          Uri.parse('https://book-store-api-mu.vercel.app/Books/$bookid');
      print(url);

      var response = await http.get(url);
      var decodedResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        Bookid resonse = Bookid.fromJson(decodedResponse);
        print('sssssssssssssss ${resonse.book!.price}');

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
