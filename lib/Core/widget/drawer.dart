import 'package:adabeharam/Core/utils/esay_size.dart';
import 'package:adabeharam/Core/utils/gr.dart';
import 'package:adabeharam/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class CustomDrawer extends StatelessWidget {
  final ZoomDrawerController controller = ZoomDrawerController();
  CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: EsaySize.width(context) * 0.6,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: CustomGradient.gr(context),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16), bottomLeft: Radius.circular(16))),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.div.image(
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.home),
                      Spacer(),
                      Text("item 1"),
                      Spacer(),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.home),
                      Spacer(),
                      Text("item 1"),
                      Spacer(),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.home),
                      Spacer(),
                      Text("item 1"),
                      Spacer(),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.home),
                      Spacer(),
                      Text("item 1"),
                      Spacer(),
                    ],
                  )),
            ),
            const Text("Drawer"),
          ],
        )),
      ),
    );
  }
}
