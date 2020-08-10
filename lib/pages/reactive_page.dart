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
                () => Text("age ${_.myPet.age}"),
              ),
              FlatButton(
                  onPressed: () {
                    _.setPetAge(_.myPet.age + 1);
                  },
                  child: Text("set age"))
            ],
          ),
          // body: Obx(
          //   () => ListView(
          //     children: _.mapItems.values
          //         .map(
          //           (e) => ListTile(
          //             title: Text(e),
          //             trailing: IconButton(
          //               icon: Icon(Icons.delete),
          //               onPressed: () => _.removeMapItem(e),
          //             ),
          //           ),
          //         )
          //         .toList(),
          //   ),
          // ),
          // floatingActionButton: Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     FloatingActionButton(
          //       heroTag: 'add',
          //       child: Icon(Icons.add),
          //       onPressed: () {
          //         // _.increment();
          //         // _.addItem();
          //         _.addMapItem();
          //       },
          //     ),
          //     FloatingActionButton(
          //       heroTag: 'date',
          //       child: Icon(Icons.calendar_today),
          //       onPressed: () {
          //         _.getDate();
          //       },
          //     )
          //   ],
          // ),
        );
      },
    );
  }
}
