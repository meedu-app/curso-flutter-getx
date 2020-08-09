import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:getx_demo/controllers/home_controller.dart';
import 'package:getx_demo/models/user.dart';

class HomeList extends StatelessWidget {
  const HomeList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'users',
      builder: (_) {
        if (_.loading) {
          return Center(
            child: LinearProgressIndicator(),
          );
        }
        return ListView.builder(
          itemBuilder: (context, index) {
            final User user = _.users[index];
            return ListTile(
              title: Text(user.firstName),
              subtitle: Text(user.email),
            );
          },
          itemCount: _.users.length,
        );
      },
    );
  }
}
