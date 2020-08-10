import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controllers/reactive_controller.dart';
import 'package:getx_demo/controllers/socket_client_controller.dart';

class ReactivePage extends StatelessWidget {
  const ReactivePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final socketController = Get.find<SocketClientController>();
    return GetBuilder<ReactiveController>(
      init: ReactiveController(),
      builder: (_) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoTextField(
                onChanged: (text) {
                  socketController.setSearchText(text);
                },
              ),
              // Obx(
              //   () => Text("age ${_.myPet.age}"),
              // ),
              Obx(
                () => Text(socketController.message.value),
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
