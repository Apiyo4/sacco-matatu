import 'dart:convert';
import 'package:http/http.dart' as http;
import 'constants.dart';

class ApiService {
  static Future<List<dynamic>> getUserList() async {
    try {
      final response = await http.get('${Urls.BASE_API_URL}/login');
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return null;
      }
    } catch (ex) {
      return null;
    }
  }

  static Future<List<dynamic>> postUserList() async {
    try {
      final response = await http.post('${Urls.BASE_API_URL}/register');
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return null;
      }
    } catch (ex) {
      return null;
    }
  }
}
