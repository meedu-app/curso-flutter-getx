import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:getx_demo/pages/home_page.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(
      Duration(seconds: 2),
      () {
        Get.off(
          HomePage(),
          transition: Transition.zoom,
        );
      },
    );
  }
}
