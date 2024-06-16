import 'package:adabeharam/Core/database/db_helper.dart';
import 'package:adabeharam/Core/widget/appbar.dart';
import 'package:adabeharam/Features/MainPage_articles/presentation/screens/articles/article_list2.dart';
import 'package:adabeharam/Features/MainPage_articles/presentation/screens/main_page.dart';
import 'package:adabeharam/Features/MainPage_articles/repository/listview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticleList1 extends StatelessWidget {
  final int id;
  const ArticleList1({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: CustomAppbar.appbar(),
        body: SingleChildScrollView(
          child: FutureBuilder<List<Map<String, dynamic>>>(
            future: DBhelper().getArticlesAndGroups(id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No Data Found'));
              } else {
                final data = snapshot.data!;
                return CommonListView(
                  data: data,
                  onPress: (index) async {
                    var db = await DBhelper()
                        .getArticlesAndGroups(data[index]["id"]);
                    if (db.any((element) => element.containsKey("_text"))) {
                      Get.to(MainPage(
                        id: data[index]["id"],
                      ));
                    } else {
                      Get.to(() => ArticleList2(
                            id: data[index]["id"],
                          ));
                    }
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
