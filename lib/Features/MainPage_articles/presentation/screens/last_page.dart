import 'package:adabeharam/Core/database/db_helper.dart';
import 'package:adabeharam/Core/utils/gr.dart';
import 'package:adabeharam/Core/widget/appbar.dart';
import 'package:adabeharam/Features/Content/presentation/content.dart';
import 'package:adabeharam/Features/MainPage_articles/repository/listview.dart';
import 'package:adabeharam/main.dart';
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
        appBar: CustomAppbar.appbar(
          context,
          commonController,
        ),
        body: CustomGradient.containerGradient(
          context: context,
          child: SingleChildScrollView(
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
                  return CommonListView(
                    data: data,
                    onPress: (p0) {
                      Get.toNamed('${ContentPage.rn}?id=$id');
                    },
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
