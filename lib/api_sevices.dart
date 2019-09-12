import 'package:http/http.dart' as http;
import 'constants.dart';
import 'dart:async' show Future;


class ApiService {
  static Future<bool> createPost(Map<String, dynamic> post) async {
    try{
      final response = await http.post(
          "${Urls.BASE_API_URL}/user/registration", body: post);
      return response.statusCode == 201;
    }
    catch (e) {
      return false;
    }
  }






  static Future<bool> addPost(Map<String, dynamic> post) async {

    try {
      final response = await http.post('${Urls.BASE_API_URL}/user/login', body: post);
      return response.statusCode == 201;
    }
    catch (e) {
      return false;
    }
  }

}


