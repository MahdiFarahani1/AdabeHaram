import 'package:adabeharam/Core/utils/esay_size.dart';
import 'package:adabeharam/Features/MainPage_articles/repository/title_appbar.dart';
import 'package:adabeharam/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';

class CustomAppbar {
  static AppBar appbar(
    BuildContext context,
  ) {
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
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: SizedBox(
                      width: 25,
                      height: 25,
                      child: Assets.images.backIcon
                          .image(width: 5, height: 5, fit: BoxFit.cover),
                    )),
              ),
              NameCat.nameCategory.length < 35
                  ? Text(NameCat.nameCategory)
                  : SizedBox(
                      width: EsaySize.width(context) * 0.7,
                      height: 50,
                      child: Marquee(
                        text: NameCat.nameCategory,
                        blankSpace: 30,
                        velocity: 50,
                      )),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const SizedBox(
                      width: 25,
                      height: 25,
                      child: Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
