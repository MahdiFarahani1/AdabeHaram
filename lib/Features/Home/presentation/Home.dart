import 'package:adabeharam/Core/database/db_helper.dart';
import 'package:adabeharam/Core/utils/gr.dart';
import 'package:adabeharam/Features/MainPage_articles/presentation/screens/articles/article_list2.dart';
import 'package:adabeharam/Features/MainPage_articles/presentation/screens/last_page.dart';
import 'package:adabeharam/Features/MainPage_articles/repository/title_appbar.dart';
import 'package:adabeharam/Features/Prayers/presentation/prayer_id1.dart';
import 'package:adabeharam/Features/Prayers/presentation/prayer_id2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Home extends StatelessWidget {
  static const String rn = "/home";

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

    // Define the onPress functions for each category
    final List<VoidCallback> categoryOnpressList = [
      () {
        Get.toNamed('${PrayerId1.rn}?id=1');
      },
      () {
        Get.toNamed('${PrayerId2.rn}?id=2');
      },
      () {
        print("Category 3 pressed");
      },
      () {
        print("Category 4 pressed");
      },
      () {
        print("Category 5 pressed");
      },
    ];

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: CustomGradient.gr(context)),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12, top: 8),
                      child:
                          const Text("یکی را انتخاب کنید ...").animate().fade(
                                duration: const Duration(milliseconds: 1000),
                              ),
                    )),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FutureBuilder<List<Map<String, dynamic>>>(
                      future: DBhelper.getCat(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}'),
                          );
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return const Center(child: Text('No Data Found'));
                        } else {
                          final data = snapshot.data!;
                          return GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.1,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                            ),
                            itemCount: data.length + categotyList.length,
                            itemBuilder: (context, index) {
                              Widget button;
                              if (index < data.length) {
                                button = ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 16,
                                    ),
                                    elevation: 6,
                                    shadowColor: Colors.black.withOpacity(0.8),
                                  ),
                                  onPressed: () async {
                                    var db = await DBhelper()
                                        .getArticlesAndGroups(
                                            data[index]["id"]);
                                    if (db.any((element) =>
                                        element["_text"] != null)) {
                                      Get.toNamed(
                                          '${LastPage.rn}?id=${data[index]["id"]}');
                                    } else {
                                      Get.toNamed(
                                          '${ArticleList2.rn}?id=${data[index]["id"]}');
                                    }
                                    NameCat.nameCategory =
                                        snapshot.data?[index]['title'];
                                  },
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Icon(
                                        Icons.article,
                                        size: 50,
                                      ),
                                      Text(
                                        data[index]["title"],
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                int categoryIndex = index - data.length;
                                button = ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 16, // Increase height
                                    ),
                                    elevation: 6,
                                    shadowColor: Colors.black.withOpacity(0.8),
                                  ),
                                  onPressed: categoryOnpressList[categoryIndex],
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Icon(
                                        Icons.category,
                                        size: 50,
                                      ),
                                      Text(
                                        categotyList[categoryIndex],
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                              if (index % 2 == 0) {
                                return button.animate().fade().moveX(
                                    begin: 500,
                                    duration:
                                        const Duration(milliseconds: 500));
                              } else {
                                return button.animate().fade().moveX(
                                    begin: -500,
                                    duration:
                                        const Duration(milliseconds: 500));
                              }
                            },
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
