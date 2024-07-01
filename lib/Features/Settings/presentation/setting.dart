import 'package:adabeharam/Core/widget/appbar.dart';
import 'package:adabeharam/Features/Settings/presentation/getx/setting_controller.dart';
import 'package:adabeharam/Features/Settings/widgets/base.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  static const String rn = "/settings";
  final settingController = Get.put(SettingController());
  Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppbar.littleAppbar(context),
            fontFamily(context),
            fontSize(context),
          ],
        ),
      ),
    );
  }

  ItemSetting fontSize(BuildContext context) {
    return ItemSetting(
      icon: Icons.text_fields,
      child: Column(
        children: [
          Obx(() => Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 5),
                child: SliderTheme(
                  data: SliderThemeData(
                    activeTrackColor: Colors.white,
                    trackHeight: 1,
                    inactiveTrackColor: const Color.fromRGBO(158, 158, 158, 1),
                    thumbColor: Colors.white,
                    inactiveTickMarkColor: Colors.grey,
                    activeTickMarkColor: Colors.transparent,
                    valueIndicatorColor: Theme.of(context).primaryColor,
                  ),
                  child: Slider(
                    label:
                        settingController.textFontSize.value.toInt().toString(),
                    divisions: 15,
                    value: settingController.textFontSize.value,
                    min: 10,
                    max: 25,
                    onChanged: (value) {
                      settingController.changeFontSize(value);
                    },
                  ),
                ),
              )),
          Obx(() => Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Text(
                  "بِسْمِ اللَّـهِ الرَّحْمَـٰنِ الرَّحِيمِ",
                  style: TextStyle(
                      fontSize: settingController.textFontSize.value,
                      color: Colors.white),
                ),
              )),
        ],
      ),
    );
  }

  ItemSetting fontFamily(BuildContext context) {
    return ItemSetting(
        icon: Icons.font_download,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: SliderTheme(
                    data: const SliderThemeData(
                      activeTrackColor: Colors.white,
                      trackHeight: 1,
                      inactiveTrackColor: Color.fromRGBO(158, 158, 158, 1),
                      thumbColor: Colors.white,
                      inactiveTickMarkColor: Colors.grey,
                      activeTickMarkColor: Colors.transparent,
                    ),
                    child: Slider(
                      divisions: 2,
                      value: settingController.familyValue.value,
                      min: 0,
                      max: 2,
                      onChanged: (value) {
                        settingController.changeFontFamily(value);
                      },
                    ),
                  ),
                )),
            Obx(() => Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "بِسْمِ اللَّـهِ الرَّحْمَـٰنِ الرَّحِيمِ",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: settingController.textFontFamily.value),
                ))),
          ],
        ));
  }
}
