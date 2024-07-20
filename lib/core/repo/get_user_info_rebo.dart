import 'dart:convert';
import 'package:bookstore/models/get_user_info_model.dart';
import 'package:http/http.dart' as http;

class GetUserInfoRepo {
  Future<GetUserInfoModel?> getUserInfo({required String token}) async {
    try {
      var response = await http.get(
          Uri.parse('https://book-store-api-mu.vercel.app/User/Info'),
          headers: {
            'Authorization': 'Bearer $token',
          });

      var decodedResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        GetUserInfoModel myResponse =
            GetUserInfoModel.fromJson(decodedResponse);
        return myResponse;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
