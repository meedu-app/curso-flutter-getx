import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:getx_demo/api/users_api.dart';
import 'package:getx_demo/models/user.dart';
import 'package:getx_demo/pages/profile_page.dart';

class HomeController extends GetxController {
  int _counter = 0;
  List<User> _users = [];
  bool _loading = true;

  bool get loading => _loading;
  int get counter => _counter;
  List<User> get users => _users;

  @override
  void onInit() {
    super.onInit();
    print("same as initState");
  }

  @override
  void onReady() {
    super.onReady();
    print("onReady");
    this.loadUsers();
  }

  Future<void> loadUsers() async {
    final data = await UsersAPI.instance.getUsers(1);
    this._users = data;
    this._loading = false;
    update(['users']);
  }

  void increment() {
    this._counter++;
    update(['text'], _counter >= 10);
  }

  showProfilePage(User user) {
    Get.to(ProfilePage(), arguments: user);
  }
}
