import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:getx_demo/models/user.dart';

class ProfileController extends GetxController {
  User _user;
  User get user => _user;

  String _inputText = '';

  @override
  void onInit() {
    super.onInit();
    this._user = Get.arguments as User;
  }

  void onInputTextChanged(String text) {
    this._inputText = text;
  }

  void goToBackWithData() {
    if (this._inputText.trim().length > 0) {
      Get.back(result: this._inputText);
    } else {
      showCupertinoModalPopup(
        context: Get.overlayContext,
        builder: (_) => CupertinoActionSheet(
          title: Text("ERROR"),
          message: Text("Ingrese un dato válido"),
          cancelButton: CupertinoActionSheetAction(
            child: Text("ACEPTAR"),
            onPressed: () => Get.back(),
          ),
        ),
      );
    }
  }
}
