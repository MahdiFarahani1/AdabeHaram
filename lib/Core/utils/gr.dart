import 'package:adabeharam/Core/utils/esay_size.dart';
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

  static Container containerGradient(
      {required Widget child, required BuildContext context}) {
    return Container(
      width: EsaySize.width(context),
      height: EsaySize.height(context),
      decoration: BoxDecoration(gradient: gr(context)),
      child: child,
    );
  }
}
