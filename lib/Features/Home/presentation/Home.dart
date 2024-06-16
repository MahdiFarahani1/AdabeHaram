import 'package:adabeharam/Core/database/db_helper.dart';
import 'package:adabeharam/Core/utils/esay_size.dart';
import 'package:adabeharam/Features/Home/presentation/wraperHome.dart';
import 'package:adabeharam/Features/MainPage_articles/presentation/screens/articles/article_list1.dart';
import 'package:adabeharam/Features/MainPage_articles/presentation/screens/main_page.dart';
import 'package:adabeharam/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final ZoomDrawerController controller;
  const Home({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    const List<String> categotyList = [
      "item1",
      "item2",
      "item3",
      "item4",
      "item5"
    ];
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //       onPressed: () {
      //         controller.toggle?.call();
      //       },
      //       icon: const Icon(Icons.menu)),
      // ),
      body: Stack(
        children: [
          Assets.images.bg.image(
              width: EsaySize.width(context),
              height: EsaySize.height(context),
              fit: BoxFit.cover),
          Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: EsaySize.width(context) * 0.8,
                height: EsaySize.height(context) * 0.6,
                child: ListView(
                  children: [
                    FutureBuilder<List<Map<String, dynamic>>>(
                      future: DBhelper.getCat(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return const Center(child: Text('No Data Found'));
                        } else {
                          final data = snapshot.data!;
                          return SizedBox(
                            width: EsaySize.width(context) * 0.2,
                            height: EsaySize.height(context) * 0.175,
                            child: ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                return ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: BeveledRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16))),
                                  onPressed: () async {
                                    var db = await DBhelper()
                                        .getArticlesAndGroups(
                                            data[index]["id"]);
                                    if (db.any((element) =>
                                        element["_text"] != null)) {
                                      Get.to(WraperHome(
                                          drawerController: controller,
                                          routeName: MainPage(
                                            id: data[index]["id"],
                                          )));
                                      print("article have _text");
                                    } else {
                                      Get.to(WraperHome(
                                          drawerController: controller,
                                          routeName: ArticleList1(
                                              id: data[index]["id"])));

                                      print("article dont have _text");
                                    }
                                  },
                                  child: Text(
                                    data[index]["title"],
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                );
                              },
                            ),
                          );
                        }
                      },
                    ),
                    ...categotyList.map(
                      (e) => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(16))),
                          onPressed: () async {
                            var a = DBhelper().getArticlesAndGroups(1);
                            print(await a);
                          },
                          child: Text(e,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold))),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
