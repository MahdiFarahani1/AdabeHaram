import 'package:adabeharam/Core/utils/esay_size.dart';
import 'package:adabeharam/Core/utils/gr.dart';
import 'package:adabeharam/Core/widget/appbar.dart';
import 'package:adabeharam/Core/widget/card_icon.dart';
import 'package:adabeharam/Features/MainPage_articles/repository/title_appbar.dart';
import 'package:adabeharam/Features/Search/presentation/content_search.dart';
import 'package:adabeharam/Features/Search/presentation/getx/Search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  static const String rn = "/searchpage";

  final TextEditingController textEditingController = TextEditingController();
  var controllerSearch = Get.put(MySearchController(), permanent: true);
  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomGradient.containerGradient(
        context: context,
        child: SafeArea(
          child: Column(
            children: [
              CustomAppbar.littleAppbar(context),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    controller: textEditingController,
                    onSubmitted: (value) {
                      controllerSearch.searchText(textEditingController);
                    },
                    decoration: InputDecoration(
                      hintText: 'البحث...',
                      hintTextDirection: TextDirection.rtl,
                      hintStyle: TextStyle(
                        color: Colors.grey.shade700,
                      ),
                      border: InputBorder.none,
                      suffixIcon: CardIcon.widget(
                        iconData: Icons.search,
                        onPress: () {
                          controllerSearch.searchText(textEditingController);
                        },
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: EsaySize.width(context) / 2,
                    child: Card(
                      margin:
                          const EdgeInsets.only(top: 8, left: 12, right: 16),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: GetBuilder<MySearchController>(
                          builder: (_) {
                            return CheckboxListTile(
                              title: const Text("النص"),
                              value: controllerSearch.contentBool,
                              onChanged: (value) {
                                controllerSearch.changeContentBool(value!);
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: EsaySize.width(context) / 2,
                    child: Card(
                      margin:
                          const EdgeInsets.only(top: 8, left: 16, right: 12),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: GetBuilder<MySearchController>(
                          builder: (_) {
                            return CheckboxListTile(
                              title: const Text("العنوان"),
                              value: controllerSearch.titleBool,
                              onChanged: (value) {
                                controllerSearch.changeTitleBool(value!);
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Obx(
                () => Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "نتيجة البحث  : ${controllerSearch.resultSearch.length}",
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
              ),
              const Divider(
                color: Colors.white,
                thickness: 2,
              ),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: controllerSearch.resultSearch.length,
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
                              NameCat.nameCategory =
                                  controllerSearch.resultSearch[index]["title"];
                              Get.toNamed(ContetnSearch.rn, parameters: {
                                "id": controllerSearch.resultSearch[index]["id"]
                                    .toString()
                              });
                            },
                            borderRadius: BorderRadius.circular(8),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                controllerSearch.resultSearch[index]["title"],
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
