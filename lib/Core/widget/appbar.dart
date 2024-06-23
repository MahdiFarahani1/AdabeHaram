import 'package:adabeharam/Core/utils/esay_size.dart';
import 'package:adabeharam/Core/widget/card_icon.dart';
import 'package:adabeharam/Features/Home/presentation/Home.dart';
import 'package:adabeharam/Features/MainPage_articles/repository/title_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';

class CustomAppbar {
  static AppBar appbar(BuildContext context, ZoomDrawerController controller,
      {bool? isContent = false}) {
    return AppBar(
      leading: const SizedBox(),
      actions: [
        SizedBox(
          width: EsaySize.width(
            context,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardIcon.widget(
                size: 20,
                iconData: FontAwesomeIcons.anglesLeft,
                onPress: () {
                  if (Get.previousRoute.isNotEmpty) {
                    Get.back();
                  } else {
                    Get.toNamed(Home.rn);
                  }
                },
              ),
              NameCat.nameCategory.length < 35
                  ? Text(
                      NameCat.nameCategory,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )
                  : Expanded(
                      child: Marquee(
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                      text: NameCat.nameCategory,
                      blankSpace: 30,
                      velocity: 50,
                    )),
              CardIcon.widget(
                iconData:
                    (isContent ?? false) ? FontAwesomeIcons.house : Icons.menu,
                size: 24,
                onPress: () {
                  if ((isContent ?? false) == false) {
                    controller.toggle?.call();
                  } else {
                    Get.toNamed(Home.rn);
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
