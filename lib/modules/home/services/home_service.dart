import 'package:flutter_async_demo/modules/home/models/user_res_model.dart';
import 'package:flutter_async_demo/shared/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeService {
  Future<UserResModel> getUserList() async {
    final uri = Uri.parse('${baseUrl}/users');
    final response = await http.get(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer your-access-token"
      },
    );
    if (response.statusCode == 200) {
      final jsonObjects = jsonDecode(response.body);
      return UserResModel.fromJson(jsonObjects);
    } else {
      throw Exception('Failed to load data');
    }
  }

  // get one user by id
  Future<UserResModel> getUserById(int id) async {
    try {
      final uri = Uri.parse('${baseUrl}/users/$id');
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return UserResModel.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 404) {
        throw Exception('User not found');
      } else {
        throw Exception('Failed to load data');
      }
    } catch (err) {
      throw Exception('Something went wrong');
    }
  }
}
