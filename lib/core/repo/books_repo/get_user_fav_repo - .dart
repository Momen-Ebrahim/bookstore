import 'dart:convert';
import 'package:bookstore/helper/local_network.dart';
import 'package:bookstore/models/fav_book_model.dart';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class GetfavoritesBooksRepo {
  Map<String, String> headers = {};

  Future<favbooks?> getfavoritesBooks() async {
    try {
      headers.addAll({
        'Authorization': 'Bearer ${CacheNetwork.getCacheData(key: 'token')}'
      });
      final url =
          Uri.parse('https://book-store-api-mu.vercel.app/User/Favorites');
      if (kDebugMode) {
        print(url);
      }
      var response = await http.get(url, headers: headers);
      var decodedResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        favbooks resonse = favbooks.fromJson(decodedResponse);
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
