import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:getx_demo/controllers/home_controller.dart';

class Homelabel extends StatelessWidget {
  const Homelabel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'text',
      builder: (_) => Text(_.counter.toString()),
    );
  }
}
