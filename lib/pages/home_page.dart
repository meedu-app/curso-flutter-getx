import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:getx_demo/controllers/home_controller.dart';
import 'package:getx_demo/pages/home_page_widgets/home_list.dart';
import 'package:getx_demo/pages/home_page_widgets/home_label.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) {
        return Scaffold(
          body: HomeList(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _.increment();
            },
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
