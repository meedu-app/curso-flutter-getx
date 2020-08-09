import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:getx_demo/models/user.dart';

class ProfileController extends GetxController {
  User _user;
  User get user => _user;

  @override
  void onInit() {
    super.onInit();
    this._user = Get.arguments as User;
  }
}
