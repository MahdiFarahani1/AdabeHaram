import 'package:adabeharam/Core/utils/esay_size.dart';
import 'package:adabeharam/Core/widget/card_icon.dart';
import 'package:adabeharam/Features/Home/presentation/Home.dart';
import 'package:adabeharam/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ImageViewer extends StatelessWidget {
  static const String rn = "/ImageViewer";
  const ImageViewer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isKharet = Get.parameters['isKharet'] == 'true';

    return Scaffold(
      floatingActionButton: CardIcon.widget(
        iconData: FontAwesomeIcons.house,
        onPress: () {
          Get.toNamed(Home.rn);
        },
      ),
      body: SizedBox(
          width: EsaySize.width(context),
          height: EsaySize.height(context),
          child: InteractiveViewer(
            panEnabled: true, // Allow panning
            scaleEnabled: true, // Allow scaling
            minScale: 0.5, // Minimum scale level
            maxScale: 4.0, // Maximum scale level
            child: !isKharet
                ? Assets.images.kh.image(fit: BoxFit.cover)
                : Assets.images.m.image(fit: BoxFit.cover),
          )),
    );
  }
}
