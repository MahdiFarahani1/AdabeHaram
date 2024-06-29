import 'package:adabeharam/Core/database/db_helper.dart';
import 'package:adabeharam/Core/utils/esay_size.dart';
import 'package:adabeharam/Core/widget/appbar.dart';
import 'package:adabeharam/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ContetnSearch extends StatefulWidget {
  static const String rn = "/ContetnSearch";

  const ContetnSearch({super.key});

  @override
  State<ContetnSearch> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContetnSearch> {
  bool iconFavorite = false;

  late List<Map<String, dynamic>> data;
  final box = GetStorage();

  @override
  void initState() {
    iconFavorite =
        box.read("Favorite${int.parse(Get.parameters["id"]!)}") ?? false;
    super.initState();
  }

  final controllerWeb = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: CustomAppbar.appbar(context, commonController, isContent: true),
        body: FutureBuilder<List<Map<String, dynamic>>>(
          future: DBhelper().getContentSearch(int.parse(Get.parameters["id"]!)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No Data Found'));
            } else {
              data = snapshot.data!;
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
}
