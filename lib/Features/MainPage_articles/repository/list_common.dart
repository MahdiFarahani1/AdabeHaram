import 'package:adabeharam/Core/database/db_helper.dart';
import 'package:adabeharam/Core/utils/gr.dart';
import 'package:adabeharam/Features/MainPage_articles/presentation/screens/last_page.dart';
import 'package:adabeharam/Features/MainPage_articles/repository/listview.dart';
import 'package:adabeharam/Features/MainPage_articles/repository/title_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FutureCommon {
  static Widget future({
    required int id,
    required Function(int futureID) pageBuilder,
    required BuildContext context,
  }) {
    return CustomGradient.containerGradient(
      context: context,
      child: SingleChildScrollView(
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
                  var db =
                      await DBhelper().getArticlesAndGroups(data[index]["id"]);
                  if (db.any((element) => element.containsKey("_text"))) {
                    Get.toNamed('${LastPage.rn}?id=${data[index]["id"]}');
                  } else {
                    pageBuilder(data[index]["id"]);
                  }
                  NameCat.nameCategory = snapshot.data?[index]['title'];
                },
              );
            }
          },
        ),
      ),
    );
  }
}
