import 'package:adabeharam/Features/About_Us/presentation/setting.dart';
import 'package:adabeharam/Features/Content/presentation/content.dart';
import 'package:adabeharam/Features/Favorite/presentation/favorite.dart';
import 'package:adabeharam/Features/Home/presentation/Home.dart';
import 'package:adabeharam/Features/Home/presentation/image_viewer.dart';
import 'package:adabeharam/Features/Home/presentation/wraperHome.dart';
import 'package:adabeharam/Features/Search/presentation/content_search.dart';
import 'package:adabeharam/Features/Search/presentation/search.dart';
import 'package:adabeharam/Features/Settings/presentation/setting.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import 'package:adabeharam/Features/MainPage_articles/presentation/screens/articles/article_list1.dart';
import 'package:adabeharam/Features/MainPage_articles/presentation/screens/articles/article_list2.dart';
import 'package:adabeharam/Features/MainPage_articles/presentation/screens/articles/article_list3.dart';
import 'package:adabeharam/Features/MainPage_articles/presentation/screens/articles/article_list4.dart';
import 'package:adabeharam/Features/MainPage_articles/presentation/screens/articles/article_list5.dart';
import 'package:adabeharam/Features/MainPage_articles/presentation/screens/last_page.dart';
import 'package:adabeharam/Features/Prayers/presentation/prayer_id1.dart';
import 'package:adabeharam/Features/Prayers/presentation/prayer_id2.dart';

List<GetPage<dynamic>>? pages(ZoomDrawerController controller) {
  return [
    GetPage(
      name: WraperHome.rn,
      page: () => WraperHome(
        drawerController: controller,
        mainScreen: Home(controller: controller),
      ),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Home.rn,
      page: () => WraperHome(
        drawerController: controller,
        mainScreen: Home(controller: controller),
      ),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: ArticleList1.rn,
      page: () => WraperHome(
        drawerController: controller,
        mainScreen: ArticleList1(id: int.parse(Get.parameters['id']!)),
      ),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: ArticleList2.rn,
      page: () => WraperHome(
        drawerController: controller,
        mainScreen: ArticleList2(id: int.parse(Get.parameters['id']!)),
      ),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: ArticleList2.rn,
      page: () => WraperHome(
        drawerController: controller,
        mainScreen: ArticleList2(id: int.parse(Get.parameters['id']!)),
      ),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: ArticleList3.rn,
      page: () => WraperHome(
        drawerController: controller,
        mainScreen: ArticleList3(id: int.parse(Get.parameters['id']!)),
      ),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: ArticleList4.rn,
      page: () => WraperHome(
        drawerController: controller,
        mainScreen: ArticleList4(id: int.parse(Get.parameters['id']!)),
      ),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: ArticleList5.rn,
      page: () => WraperHome(
        drawerController: controller,
        mainScreen: ArticleList5(id: int.parse(Get.parameters['id']!)),
      ),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: LastPage.rn,
      page: () => WraperHome(
        drawerController: controller,
        mainScreen: LastPage(id: int.parse(Get.parameters['id']!)),
      ),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: ContentPage.rn,
      page: () => ContentPage(id: int.parse(Get.parameters['id']!)),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: PrayerId1.rn,
      page: () => WraperHome(
        drawerController: controller,
        mainScreen: PrayerId1(id: int.parse(Get.parameters['id']!)),
      ),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: PrayerId2.rn,
      page: () => WraperHome(
        drawerController: controller,
        mainScreen: PrayerId2(id: int.parse(Get.parameters['id']!)),
      ),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: ImageViewer.rn,
      page: () => const ImageViewer(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Favorite.rn,
      page: () => Favorite(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: SearchPage.rn,
      page: () => SearchPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: ContetnSearch.rn,
      page: () => const ContetnSearch(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Settings.rn,
      page: () => const Settings(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AboutUs.rn,
      page: () => const AboutUs(),
      transition: Transition.rightToLeft,
    ),
  ];
}
