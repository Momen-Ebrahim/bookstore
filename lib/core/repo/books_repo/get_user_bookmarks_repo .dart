import 'dart:convert';
import 'package:bookstore/helper/local_network.dart';
import 'package:bookstore/models/user_bookmarks_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class GetBookmarksBooksRepo {
  Map<String, String> headers = {};

  Future<UserBookmarks?> getBookmarksBooks() async {
    try {
      headers.addAll({
        'Authorization': 'Bearer ${CacheNetwork.getCacheData(key: 'token')}'
      });
      final url =
          Uri.parse('https://book-store-api-mu.vercel.app/User/Bookmarks');
      if (kDebugMode) {
        print(url);
      }
      var response = await http.get(url, headers: headers);
      var decodedResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        UserBookmarks resonse = UserBookmarks.fromJson(decodedResponse);
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
