import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppbar {
  static AppBar appbar() {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back)),
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
    );
  }
}
