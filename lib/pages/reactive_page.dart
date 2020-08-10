import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:getx_demo/controllers/reactive_controller.dart';

class ReactivePage extends StatelessWidget {
  const ReactivePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReactiveController>(
      init: ReactiveController(),
      builder: (_) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () {
                  print("🎃");
                  return Text(
                    _.counter.value.toString(),
                    style: TextStyle(fontSize: 30),
                  );
                },
              ),
              Obx(
                () {
                  print("🤪");
                  return Text(
                    _.currentDate.value,
                    style: TextStyle(fontSize: 30),
                  );
                },
              ),
            ],
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: 'add',
                child: Icon(Icons.add),
                onPressed: () {
                  _.increment();
                },
              ),
              FloatingActionButton(
                heroTag: 'date',
                child: Icon(Icons.calendar_today),
                onPressed: () {
                  _.getDate();
                },
              )
            ],
          ),
        );
      },
    );
  }
}
