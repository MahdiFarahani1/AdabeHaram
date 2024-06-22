import 'package:adabeharam/Core/database/db_helper.dart';
import 'package:adabeharam/Core/utils/esay_size.dart';
import 'package:adabeharam/gen/assets.gen.dart';
import 'package:flutter/material.dart';
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
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () {},
              child: Assets.images.home.image(),
            )
          ],
        ),
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
                height: EsaySize.height(context) * 0.9,
                child: Column(children: [
                  Text(data[0]["title"]),
                  Expanded(
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
      
                                      <script>
                                      
                                      var images = document.getElementsByTagName('img');
      for (var i = 0; i < images.length; ++i) {
        var img = images[i];
        var a = document.createElement('a');
        a.href = img.src;
        img.parentNode.replaceChild(a, img);
        a.appendChild(img);
      }
                                      </script>
                                    </body>
                                  </html>
                                ''',
                        ),
                    ),
                  )
                ]),
              );
            }
          },
        ),
      ),
    );
  }
}
