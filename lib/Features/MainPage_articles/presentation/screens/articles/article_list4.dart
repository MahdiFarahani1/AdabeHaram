import 'package:adabeharam/Core/widget/appbar.dart';
import 'package:adabeharam/Features/MainPage_articles/presentation/screens/articles/article_list5.dart';
import 'package:adabeharam/Features/MainPage_articles/repository/list_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticleList4 extends StatelessWidget {
  static const String rn = "/ar4";

  final int id;
  const ArticleList4({
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
            Get.toNamed('${ArticleList5.rn}?id=$futureId');
          },
        ),
      ),
    );
  }
}
