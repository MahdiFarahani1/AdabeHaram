import 'package:adabeharam/Core/database/db_helper.dart';
import 'package:adabeharam/Core/utils/esay_size.dart';
import 'package:adabeharam/Core/utils/gr.dart';
import 'package:adabeharam/Core/widget/appbar.dart';
import 'package:adabeharam/Core/widget/card_icon.dart';
import 'package:adabeharam/Features/Content/presentation/getx/controller_nav_bar.dart';
import 'package:adabeharam/Features/Content/repository/format_duration.dart';
import 'package:adabeharam/Features/Favorite/presentation/favorite.dart';
import 'package:adabeharam/Features/Favorite/presentation/getx/Favorite_controller.dart';
import 'package:adabeharam/Features/Home/presentation/Home.dart';
import 'package:adabeharam/Features/MainPage_articles/repository/title_appbar.dart';
import 'package:adabeharam/Features/Settings/presentation/getx/setting_controller.dart';
import 'package:adabeharam/Features/Settings/presentation/setting.dart';
import 'package:adabeharam/main.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ContentPage extends StatefulWidget {
  static const String rn = "/content";
  final int id;
  final settingController = Get.put(SettingController());
  ContentPage({super.key, required this.id});

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  final AudioPlayer audioPlayer = AudioPlayer();
  bool iconFavorite = false;

  late List<Map<String, dynamic>> data;
  var navController = Get.put(NavBarController());
  final box = GetStorage();

  @override
  void initState() {
    iconFavorite = box.read("Favorite${widget.id}") ?? false;
    navController.initState(audioPlayer);
    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  final controllerWeb = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted);

  @override
  Widget build(BuildContext context) {
    bool isPrayerPage = Get.parameters['isPrayerPage'] == 'true';
    bool isSavePage = Get.parameters['isSavePage'] == 'true';

    final String urlAudio = Get.parameters['url'] ?? "";
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: isPrayerPage
            ? const SizedBox()
            : DraggableFab(
                child: floatingBtn(context),
              ),
        backgroundColor: Colors.white,
        appBar: CustomAppbar.appbar(context, commonController, isContent: true),
        body: FutureBuilder<List<Map<String, dynamic>>>(
          future: isPrayerPage
              ? DBhelper().getPrayersContent(widget.id)
              : isSavePage
                  ? DBhelper().getContentAllsave(widget.id)
                  : DBhelper().getContent(widget.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No Data Found'));
            } else {
              data = snapshot.data!;
              return SizedBox(
                width: EsaySize.width(context),
                height: EsaySize.height(context),
                child: Obx(() => WebViewWidget(
                      controller: controllerWeb
                        ..loadHtmlString(
                          '''
                                                  <html>
                                                    <head>
                                                      <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
                      
                                                      <style>
                                                         @font-face {
                                                        font-family: 'CustomFont';
                                                        src: url("C:/Mahdi_Flutter/projects/adabe_haram/AdabeHaram/assets/fonts/Al-Jazeera-Arabic-Regular.ttf") format('truetype');
                                                      }
    
  
                                                        body { text-align: justify;
                                                        padding: 10px !important;
                                                          font-family: 'CustomFont', sans-serif;
                                                        font-size:${widget.settingController.textFontSize};
                                                           </style>
                      
                      
                                                    </head>
                                                    <body dir ="rtl">
                                                   
                                                      ${data[0]["_text"]}
                                      
                                     
                                                </body>
                                              </html>
                                            ''',
                        ),
                    )),
              );
            }
          },
        ),
        bottomNavigationBar: isPrayerPage
            ? GetBuilder<NavBarController>(
                initState: (_) {},
                builder: (_) {
                  return Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topCenter,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 850),
                        width: EsaySize.width(context),
                        height: navController.height,
                        decoration: BoxDecoration(
                          gradient: CustomGradient.gr(context),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 25),
                              child: Align(
                                child: SizedBox(
                                  width: EsaySize.width(context) * 0.75,
                                  child: SliderTheme(
                                    data: SliderThemeData(
                                        trackHeight: 3,
                                        thumbColor:
                                            Colors.black.withOpacity(0.7),
                                        activeTrackColor:
                                            Colors.black.withOpacity(0.7)),
                                    child: Slider(
                                      min: 0,
                                      max: navController.duration.inSeconds
                                          .toDouble(),
                                      value: navController.position.inSeconds
                                          .toDouble(),
                                      onChanged: (value) async {
                                        navController.changeSliderValue(
                                            audioPlayer, value);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 22,
                                  ),
                                  child: Text(
                                    FormatDuration.formatDuration(
                                        navController.duration -
                                            navController.position),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 22,
                                  ),
                                  child: Text(
                                    FormatDuration.formatDuration(
                                        navController.duration),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            EsaySize.gap(25),
                            GestureDetector(
                              onTap: () {
                                navController.changeStateAudio(
                                    audioPlayer, urlAudio);
                              },
                              child: Card(
                                shape: const CircleBorder(),
                                child: Icon(
                                  navController.iconDataPlay,
                                  size: 60,
                                  color: Colors.black.withOpacity(0.9),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                          top: -30,
                          child: CardIcon.widget(
                            iconData: navController.iconDataArrow,
                            onPress: () {
                              navController
                                  .openNavbar(EsaySize.height(context) * 0.35);
                            },
                          )),
                    ],
                  );
                },
              )
            : const SizedBox(),
      ),
    );
  }

  SpeedDial floatingBtn(BuildContext context) {
    return SpeedDial(
      direction: SpeedDialDirection.up,
      icon: Icons.menu,
      activeIcon: Icons.close,
      gradient: CustomGradient.gr(context),
      foregroundColor: Colors.white,
      activeBackgroundColor: Colors.red,
      activeForegroundColor: Colors.white,
      visible: true,
      // gradient: CustomGr.gradient(context),
      spacing: 0,
      spaceBetweenChildren: 0,
      gradientBoxShape: BoxShape.circle,
      curve: Curves.bounceIn,
      children: [
        SpeedDialChild(
          backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
          child: Transform.scale(
              scale: 1,
              child: const Icon(
                Icons.home_outlined,
              )),
          labelBackgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
          label: "الصفحة الرئيسية",
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: () {
            Get.toNamed(Home.rn);
          },
        ),
        SpeedDialChild(
          backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
          child: StatefulBuilder(builder: (context, setState) {
            return GestureDetector(
              onTap: () async {
                DBhelper dBhelper = DBhelper();
                var controllerFavorite = Get.put(FavoriteContrller());
                setState(
                  () {
                    dBhelper.deleteArticle(id: widget.id);
                    iconFavorite = !iconFavorite;
                    if (!iconFavorite) {
                      box.remove("Favorite${widget.id}");
                    } else {
                      dBhelper.insertArticle(
                        title: data[0]["title"],
                        id: widget.id,
                        groupId: data[0]["groupId"],
                      );
                      box.write("Favorite${widget.id}", true);
                    }
                  },
                );

                controllerFavorite.updateList();
              },
              child: Transform.scale(
                  scale: 1,
                  child: Icon(
                    iconFavorite ? Icons.star : FontAwesomeIcons.star,
                    size: 20,
                  )),
            );
          }),
          labelBackgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
          label: 'المفضلة',
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: () {
            NameCat.nameCategory = "المفضلة";
            Get.toNamed(Favorite.rn);
          },
        ),
        SpeedDialChild(
          backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
          child: const Icon(
            Icons.settings_outlined,
          ),
          labelBackgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
          label: 'الإعدادات',
          labelStyle: const TextStyle(
            fontSize: 18.0,
          ),
          onTap: () {
            NameCat.nameCategory = "الإعدادات";
            Get.toNamed(Settings.rn);
          },
        ),
        SpeedDialChild(
          backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
          child: const Icon(
            Icons.share_outlined,
          ),
          label: 'حول التطبيق',
          labelBackgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: () {
            Share.share(data[0]["_text"]);
          },
        ),
      ],
    );
  }
}
