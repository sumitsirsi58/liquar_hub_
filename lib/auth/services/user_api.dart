import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:liquar_hub/auth/model/user_model.dart';

class UserService {
  final String baseUrl = 'http://192.168.1.34:3000/api';

  Future<bool> register(UserModel user) async {
    final url = Uri.parse('$baseUrl/register');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toMap()),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> login(UserModel user) async {
    final url = Uri.parse('$baseUrl/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toMap()),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}