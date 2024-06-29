import 'package:adabeharam/Core/database/db_helper.dart';
import 'package:get/get.dart';

class FavoriteContrller extends GetxController {
  var favoriteResult = [].obs;

  updateList() async {
    favoriteResult.value = await DBhelper().getAllsave();
  }
}
