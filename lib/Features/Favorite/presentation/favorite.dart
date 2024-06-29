import 'package:adabeharam/Core/database/db_helper.dart';
import 'package:adabeharam/Core/widget/appbar.dart';
import 'package:adabeharam/Features/Content/presentation/content.dart';
import 'package:adabeharam/Features/Favorite/presentation/getx/Favorite_controller.dart';
import 'package:adabeharam/Features/MainPage_articles/repository/title_appbar.dart';
import 'package:adabeharam/main.dart';
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
      appBar: CustomAppbar.appbar(context, commonController),
      body: SingleChildScrollView(
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: DBhelper().getAllsave(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No Data Found'));
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
      ),
    );
  }
}
