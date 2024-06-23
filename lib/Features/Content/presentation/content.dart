import 'package:adabeharam/Core/database/db_helper.dart';
import 'package:adabeharam/Core/utils/esay_size.dart';
import 'package:adabeharam/Core/utils/gr.dart';
import 'package:adabeharam/Core/widget/appbar.dart';
import 'package:adabeharam/main.dart';
import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ContentPage extends StatelessWidget {
  static const String rn = "/content";

  final int id;
  final controllerWeb = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted);
  ContentPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: DraggableFab(
          child: floatingBtn(context),
        ),
        backgroundColor: Colors.white,
        appBar: CustomAppbar.appbar(context, commonController, isContent: true),
        body: FutureBuilder<List<Map<String, dynamic>>>(
          future: DBhelper().getContent(id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No Data Found'));
            } else {
              final data = snapshot.data!;
              return SizedBox(
                width: EsaySize.width(context),
                height: EsaySize.height(context),
                child: WebViewWidget(
                  controller: controllerWeb
                    ..loadHtmlString(
                      '''
                                  <html>
                                    <head>
                                      <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
      
                                      <style>
                                        body { text-align: justify;
                                        padding: 10px !important;
                                           </style>
      
      
                                    </head>
                                    <body dir ="rtl">
                                   
                                      ${data[0]["_text"]}
                      
                     
                                </body>
                              </html>
                            ''',
                    ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  SpeedDial floatingBtn(BuildContext context) {
    return SpeedDial(
      direction: SpeedDialDirection.up,
      icon: Icons.menu,
      activeIcon: Icons.close,
      gradient: CustomGradient.gr(context),
      foregroundColor: Colors.white,
      activeBackgroundColor: Colors.red,
      activeForegroundColor: Colors.white,
      closeDialOnPop: true,
      visible: true,
      // gradient: CustomGr.gradient(context),
      spacing: 0,
      spaceBetweenChildren: 0,
      gradientBoxShape: BoxShape.circle,
      curve: Curves.bounceIn,
      children: [
        SpeedDialChild(
          backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
          child: Transform.scale(
              scale: 1,
              child: const Icon(
                Icons.home_outlined,
              )),
          labelBackgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
          label: 'خانه',
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: () {},
        ),
        SpeedDialChild(
          backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
          child: Transform.scale(
              scale: 1,
              child: const Icon(
                FontAwesomeIcons.star,
                size: 20,
              )),
          labelBackgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
          label: 'ذخیره',
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: () {},
        ),
        SpeedDialChild(
          backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
          child: const Icon(
            Icons.settings_outlined,
          ),
          labelBackgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
          label: 'تنظیمات',
          labelStyle: const TextStyle(
            fontSize: 18.0,
          ),
          onTap: () {},
        ),
        SpeedDialChild(
          backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
          child: const Icon(
            Icons.share_outlined,
          ),
          label: 'اشتراک گذاری',
          labelBackgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: () {},
        ),
      ],
    );
  }
}
