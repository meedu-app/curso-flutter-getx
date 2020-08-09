import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:getx_demo/controllers/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (_) => Scaffold(
        body: Center(
          child: Text(_.user.firstName),
        ),
      ),
    );
  }
}
