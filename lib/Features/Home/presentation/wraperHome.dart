import 'package:adabeharam/Core/utils/esay_size.dart';
import 'package:adabeharam/Core/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class WraperHome extends StatefulWidget {
  static const String rn = "/wraperHome";
  final ZoomDrawerController drawerController;
  final Widget mainScreen;
  const WraperHome(
      {super.key, required this.drawerController, required this.mainScreen});

  @override
  State<WraperHome> createState() => _WraperHomeState();
}

class _WraperHomeState extends State<WraperHome> {
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
        androidCloseOnBackTap: true,
        menuScreenWidth: EsaySize.width(context) * 0.6,
        mainScreenTapClose: true,
        style: DrawerStyle.defaultStyle,
        angle: 0,
        drawerShadowsBackgroundColor: Theme.of(context).splashColor,
        showShadow: false,
        menuBackgroundColor: Theme.of(context).colorScheme.tertiary,
        isRtl: true,
        controller: widget.drawerController,
        menuScreen: CustomDrawer(),
        mainScreen: widget.mainScreen);
  }
}
