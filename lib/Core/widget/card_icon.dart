import 'package:flutter/material.dart';

class CardIcon {
  static Widget widget(
      {required IconData iconData,
      required VoidCallback onPress,
      double? size}) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        width: 56,
        height: 56,
        margin: const EdgeInsets.all(1.5),
        child: Card(
          elevation: 6,
          child: Icon(
            size: size,
            iconData,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
