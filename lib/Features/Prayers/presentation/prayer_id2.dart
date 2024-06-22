import 'package:adabeharam/Core/database/db_helper.dart';
import 'package:adabeharam/Features/MainPage_articles/repository/listview.dart';
import 'package:flutter/material.dart';

class PrayerId2 extends StatelessWidget {
  static const String rn = "/Prayer2";

  final int id;

  const PrayerId2({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: DBhelper().getPrayers(id),
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
                  // var db = await DBhelper()
                  //     .getArticlesAndGroups(data[index]["id"]);
                  // if (db.any((element) => element.containsKey("_text"))) {
                  //   Get.to(MainPage(
                  //     id: data[index]["id"],
                  //   ));
                  // } else {
                  //   Get.to(() => ArticleList3(
                  //         id: data[index]["id"],
                  //       ));
                  // }
                },
              );
            }
          },
        ),
      ),
    );
  }
}
