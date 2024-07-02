import 'package:adabeharam/Core/utils/esay_size.dart';
import 'package:adabeharam/Features/Home/presentation/wraperHome.dart';
import 'package:adabeharam/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  static const String rn = "/splashscreen";
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(
      const Duration(
        seconds: 2,
      ),
      () {
        Get.offAllNamed(WraperHome.rn);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: EsaySize.width(context),
        height: EsaySize.height(context),
        child: Image.asset(
          Assets.images.splash.path,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
