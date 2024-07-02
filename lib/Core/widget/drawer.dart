import 'package:adabeharam/Core/utils/esay_size.dart';
import 'package:adabeharam/Core/utils/gr.dart';
import 'package:adabeharam/Features/About_Us/presentation/about_us.dart';
import 'package:adabeharam/Features/Favorite/presentation/favorite.dart';
import 'package:adabeharam/Features/Home/presentation/Home.dart';
import 'package:adabeharam/Features/Home/presentation/image_viewer.dart';
import 'package:adabeharam/Features/MainPage_articles/presentation/screens/articles/article_list2.dart';
import 'package:adabeharam/Features/MainPage_articles/presentation/screens/last_page.dart';
import 'package:adabeharam/Features/MainPage_articles/repository/title_appbar.dart';
import 'package:adabeharam/Features/Prayers/presentation/prayer_id1.dart';
import 'package:adabeharam/Features/Settings/presentation/setting.dart';
import 'package:adabeharam/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class CustomDrawer extends StatelessWidget {
  final ZoomDrawerController controller = ZoomDrawerController();
  CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      body: Container(
        width: EsaySize.width(context) * 0.6,
        height: EsaySize.height(context),
        decoration: BoxDecoration(
            gradient: CustomGradient.gr(context),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16), bottomLeft: Radius.circular(16))),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Assets.images.header.image(
                  height: 140,
                  width: EsaySize.width(context) * 0.6,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  style: buttonStyle(),
                  onPressed: () {
                    Get.toNamed(Home.rn);
                  },
                  child: const Center(
                    child: Text("الصفحة الرئيسية"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                    onPressed: () async {
                      Get.toNamed('${LastPage.rn}?id=1');

                      NameCat.nameCategory = "آداب السفر";
                    },
                    style: buttonStyle(),
                    child: const Center(
                      child: Text("آداب السفر"),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                    style: buttonStyle(),
                    onPressed: () {
                      Get.toNamed('${ArticleList2.rn}?id=2');

                      NameCat.nameCategory = "المدينة المنوره";
                    },
                    child: const Center(
                      child: Text("المدينة المنوره"),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                    style: buttonStyle(),
                    onPressed: () {
                      Get.toNamed('${ArticleList2.rn}?id=67');

                      NameCat.nameCategory = "مكة المكرمة";
                    },
                    child: const Center(
                      child: Text("مكة المكرمة"),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                    style: buttonStyle(),
                    onPressed: () {
                      NameCat.nameCategory = "الأدعية والزيارات";

                      Get.toNamed('${PrayerId1.rn}?id=1');
                    },
                    child: const Center(
                      child: Text("الأدعية والزيارات"),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                    onPressed: () {
                      NameCat.nameCategory = "أدعية الطواف";

                      Get.toNamed('${PrayerId1.rn}?id=2');
                    },
                    style: buttonStyle(),
                    child: const Center(
                      child: Text("أدعية الطواف"),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                    style: buttonStyle(),
                    onPressed: () {
                      NameCat.nameCategory = "معالم مكة";

                      Get.toNamed(ImageViewer.rn,
                          parameters: {'isKharet': 'true'});
                    },
                    child: const Center(
                      child: Text("معالم مكة"),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                    style: buttonStyle(),
                    onPressed: () {
                      NameCat.nameCategory = "خارطة البقيع";

                      Get.toNamed(ImageViewer.rn,
                          parameters: {'isKharet': 'false'});
                    },
                    child: const Center(
                      child: Text("خارطة البقيع"),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                    style: buttonStyle(),
                    onPressed: () {
                      NameCat.nameCategory = "المفضلة";
                      Get.toNamed(Favorite.rn);
                    },
                    child: const Center(
                      child: Text("المفضلة"),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                    style: buttonStyle(),
                    onPressed: () {
                      NameCat.nameCategory = "حول التطبیق";

                      Get.toNamed(AboutUs.rn);
                    },
                    child: const Center(
                      child: Text("حول التطبیق"),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                    style: buttonStyle(),
                    onPressed: () {
                      Share.share(
                          "https://play.google.com/store/apps/details?id=com.dijlah.adabalharamin");
                    },
                    child: const Center(
                      child: Text("مشاركة التطبيق"),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                    style: buttonStyle(),
                    onPressed: () {
                      NameCat.nameCategory = "الإعدادات";
                      Get.toNamed(Settings.rn);
                    },
                    child: const Center(
                      child: Text("الإعدادات"),
                    )),
              ),
              EsaySize.gap(30),
              Container(
                alignment: Alignment.center,
                width: EsaySize.width(context) * 0.6,
                height: 25,
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.only(bottomLeft: Radius.circular(12)),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: Text(
                  "الاصدار: 1.0",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 10.5),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }

  ButtonStyle buttonStyle() {
    return ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        shadowColor: Colors.black,
        elevation: 8);
  }
}
