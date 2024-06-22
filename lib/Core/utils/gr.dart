import 'package:flutter/material.dart';

class CustomGradient {
  static LinearGradient gr(BuildContext context) {
    return LinearGradient(
      colors: [
        Theme.of(context).colorScheme.primary,
        Theme.of(context).colorScheme.inversePrimary
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }
}
