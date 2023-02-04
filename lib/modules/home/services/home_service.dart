import 'package:flutter_async_demo/modules/home/models/user_res_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeService {
  Future<List<UserResModel>> getUserList({int page = 1}) async {
    final uri =
        Uri.parse('https://jsonplaceholder.typicode.com/users?page=$page');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      List<UserResModel> userList = []; // empty list

      List<dynamic> body = jsonDecode(response.body);

      // map each item in body to UserResModel
      userList =
          body.map((dynamic item) => UserResModel.fromJson(item)).toList();

      return userList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  // get one user by id
  Future<UserResModel> getUserById(int id) async {
    try {
      final uri = Uri.parse('https://jsonplaceholder.typicode.com/userss/$id');
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
