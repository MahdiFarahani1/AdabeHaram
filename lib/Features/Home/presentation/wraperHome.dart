import 'package:adabeharam/Core/utils/esay_size.dart';
import 'package:adabeharam/Core/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class WraperHome extends StatefulWidget {
  final ZoomDrawerController drawerController;
  final dynamic routeName;
  const WraperHome(
      {super.key, required this.drawerController, required this.routeName});

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
        showShadow: true,
        menuBackgroundColor: Colors.amberAccent.shade100,
        shadowLayer1Color: Colors.grey.shade400.withAlpha(100),
        shadowLayer2Color: Colors.grey.shade500.withAlpha(100),
        isRtl: true,
        controller: widget.drawerController,
        menuScreen: CustomDrawer(),
        mainScreen: widget.routeName);
  }
}
