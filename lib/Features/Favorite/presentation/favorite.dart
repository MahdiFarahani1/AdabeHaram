import 'package:adabeharam/Core/database/db_helper.dart';
import 'package:adabeharam/Core/utils/esay_size.dart';
import 'package:adabeharam/Core/utils/gr.dart';
import 'package:adabeharam/Core/widget/appbar.dart';
import 'package:adabeharam/Features/Content/presentation/content.dart';
import 'package:adabeharam/Features/Favorite/presentation/getx/Favorite_controller.dart';
import 'package:adabeharam/Features/MainPage_articles/repository/title_appbar.dart';
import 'package:adabeharam/gen/fonts.gen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Favorite extends StatelessWidget {
  static const String rn = "/favorite";

  var controllerFavorite = Get.put(FavoriteContrller(), permanent: true);

  Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppbar.littleAppbar(context),
              FutureBuilder<List<Map<String, dynamic>>>(
                future: DBhelper().getAllsave(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        alignment: Alignment.center,
                        width: EsaySize.width(context),
                        height: 50,
                        decoration: BoxDecoration(
                            gradient: CustomGradient.gr(context),
                            borderRadius: BorderRadius.circular(8)),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: DefaultTextStyle(
                            style: const TextStyle(
                                fontSize: 20.0, fontFamily: FontFamily.arabic),
                            child: AnimatedTextKit(
                              isRepeatingAnimation: true,
                              repeatForever: true,
                              pause: const Duration(milliseconds: 1500),
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  'لم يتم العثور على نتيجة',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: Obx(
                        () => ListView.builder(
                          itemCount: controllerFavorite.favoriteResult.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 14,
                              child: Card(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                elevation: 6,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    NameCat.nameCategory = controllerFavorite
                                        .favoriteResult[index]["title"];
                                    Get.toNamed(
                                        '${ContentPage.rn}?id=${controllerFavorite.favoriteResult[index]["id"]}');
                                  },
                                  borderRadius: BorderRadius.circular(8),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      controllerFavorite.favoriteResult[index]
                                          ["title"],
                                      textDirection: TextDirection.rtl,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
