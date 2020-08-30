import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_demo/controllers/socket_client_controller.dart';
import 'package:getx_demo/models/pet.dart';

class ReactiveController extends GetxController {
  RxInt counter = 0.obs;
  RxString currentDate = ''.obs;

  RxList<String> items = List<String>().obs;
  RxMap<String, dynamic> mapItems = Map<String, dynamic>().obs;

  Pet myPet = Pet(name: "Lulu", age: 1);

  StreamSubscription<String> _subscription;

  @override
  void onInit() {
    super.onInit();
    final SocketClientController socketClientController =
        Get.find<SocketClientController>();

    _subscription = socketClientController.message.listen((String data) {
      // print("message:::: $data");
    });
  }

  @override
  Future<void> onClose() {
    _subscription?.cancel();
    return super.onClose();
  }

  void increment() {
    counter.value++;
  }

  void getDate() {
    currentDate.value = DateTime.now().toString();
  }

  void addItem() {
    items.add(DateTime.now().toString());
  }

  void addMapItem() {
    final String key = DateTime.now().toString();
    mapItems.add(key, key);
  }

  void removeItem(int index) {
    items.removeAt(index);
  }

  void removeMapItem(String key) {
    mapItems.remove(key);
  }

  void setPetAge(int age) {
    myPet.age = age;
    // myPet.value = myPet.value.copyWith(age: age);
  }
}
