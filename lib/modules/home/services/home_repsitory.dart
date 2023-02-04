import 'package:flutter_async_demo/modules/home/services/home_service.dart';

import '../models/user_res_model.dart';

class HomeRepository {
  final HomeService homeService = HomeService();

  Future<UserResModel> getUserList() async {
    try {
      final userList = await homeService.getUserList();
      return userList;
    } catch (err) {
      throw Exception('Something went wrong');
    }
  }
}