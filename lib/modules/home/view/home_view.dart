import 'package:flutter/material.dart';
import 'package:flutter_async_demo/modules/home/models/user_res_model.dart';
import 'package:flutter_async_demo/modules/home/services/home_service.dart';

import 'user_detail_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeService homeService;
  @override
  void initState() {
    super.initState();
    homeService = HomeService(); // create instance of HomeService
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: FutureBuilder<List<UserResModel>>(
        future: homeService.getUserList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              final userList = snapshot.data;

              if (userList == null) {
                return const Center(
                  child: Text('No data'),
                );
              } else {
                return ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(userList[index].name),
                      subtitle: Text(userList[index].website ?? ''),
                      onTap: () {
                        final userId = userList[index].id;
                        final route = MaterialPageRoute(
                          builder: (context) => UserDetailView(userId: userId),
                        );
                        Navigator.push(context, route);
                      }
                    );
                  },
                );
              }
            }

            return const Center(
              child: Text('Something went wrong'),
            );
          } else {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
        },
      ),
    );
  }
}
