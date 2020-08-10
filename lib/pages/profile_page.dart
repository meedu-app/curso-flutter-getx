import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:getx_demo/controllers/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Get.back(),
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("${_.user.firstName} ${_.user.lastName}"),
              SizedBox(height: 10),
              CupertinoTextField(
                onChanged: _.onInputTextChanged,
              ),
              SizedBox(height: 10),
              CupertinoButton(
                child: Text("Aceptar"),
                onPressed: _.goToBackWithData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
