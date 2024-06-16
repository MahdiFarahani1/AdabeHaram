import 'package:flutter/material.dart';

class CommonGradient {
  static LinearGradient gr() {
    return LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.amber.shade400,
          Colors.amber.shade200,
          Colors.amber.shade100
        ]);
  }
}
