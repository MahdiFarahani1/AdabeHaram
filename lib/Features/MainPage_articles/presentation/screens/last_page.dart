import 'package:adabeharam/Core/database/db_helper.dart';
import 'package:adabeharam/Core/utils/esay_size.dart';
import 'package:adabeharam/Core/widget/appbar.dart';
import 'package:adabeharam/Features/Content/presentation/content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LastPage extends StatelessWidget {
  static const String rn = "/mainPage";

  final int id;
  const LastPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: CustomAppbar.appbar(context),
        body: SingleChildScrollView(
          child: FutureBuilder<List<Map<String, dynamic>>>(
            future: DBhelper().getArticle(id),
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
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              offset: const Offset(2, 3),
                              color: Colors.amber.shade100)
                        ]),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4))),
                          onPressed: () async {
                            Get.toNamed('${ContentPage.rn}?id=$id');

                            // var db = await DBhelper()
                            //     .getArticlesAndGroups(data[index]["id"]);
                            // if (db.any(
                            //     (element) => element.containsKey("_text"))) {
                            //   Get.to(const MainPage());
                            //   print("article have _text");
                            // } else {
                            //   print("article dont have _text");
                            // }
                          },
                          child: Text(
                            data[index]["title"],
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
