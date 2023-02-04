import 'package:flutter/material.dart';

import '../models/user_res_model.dart';
import '../services/home_service.dart';

class UserDetailView extends StatefulWidget {
  const UserDetailView({Key? key, required this.userId}) : super(key: key);

  final int userId;

  @override
  State<UserDetailView> createState() => _UserDetailViewState();
}

class _UserDetailViewState extends State<UserDetailView> {


  late HomeService homeService;

  @override
  void initState() {
    super.initState();
    homeService = HomeService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Detail'),
      ),
      body: FutureBuilder<UserResModel>(
        future: homeService.getUserById(widget.userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              final user = snapshot.data;
              if (user == null) {
                return const Center(
                  child: Text('No data'),
                );
              } else {
                return ListView(
                  children: [
                    ListTile(
                      title: const Text('Name'),
                      subtitle: Text(user.name),
                    ),
                    ListTile(
                      title: const Text('Username'),
                      subtitle: Text(user.username),
                    ),
                    ListTile(
                      title: const Text('Email'),
                      subtitle: Text(user.email),
                    ),
                    ListTile(
                      title: const Text('Phone'),
                      subtitle: Text(user.phone),
                    ),
                    ListTile(
                      title: const Text('Website'),
                      subtitle: Text(user.website ?? ''),
                    ),
                  ],
                );
              }
            } else {
              return   Center(
                child: Text(snapshot.error.toString()),
              );
            }
          } else {
            return const Center(
              child: Text('No data'),
            );
          }
        },
      )
    );
  }
}
