import 'package:adabeharam/Core/widget/appbar.dart';
import 'package:adabeharam/Features/MainPage_articles/presentation/screens/articles/article_list3.dart';
import 'package:adabeharam/Features/MainPage_articles/repository/list_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticleList2 extends StatelessWidget {
  static const String rn = "/ar2";

  final int id;
  const ArticleList2({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: CustomAppbar.appbar(context),
        body: FutureCommon.future(
          context: context,
          id: id,
          pageBuilder: (futureId) {
            Get.toNamed('${ArticleList3.rn}?id=$futureId');
          },
        ),
      ),
    );
  }
}
