import 'package:adabeharam/Core/database/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MySearchController extends GetxController {
  bool titleBool = true;
  bool contentBool = true;

  var resultSearch = [].obs;
  changeTitleBool(bool value) {
    titleBool = value;

    update();
  }

  changeContentBool(bool value) {
    contentBool = value;

    update();
  }

  searchText(TextEditingController textEditingController) async {
    SearchEnum searchEnum = SearchEnum.both;
    if (titleBool && !contentBool) {
      searchEnum = SearchEnum.title;
    } else if (!titleBool && contentBool) {
      searchEnum = SearchEnum.content;
    }
    DBhelper dBhelper = DBhelper();
    var results = await dBhelper.getSearch(textEditingController.text,
        searchEnum: searchEnum);
    resultSearch.value = results;
  }
}
