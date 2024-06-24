import 'package:adabeharam/Core/database/db_helper.dart';
import 'package:adabeharam/Core/widget/appbar.dart';
import 'package:adabeharam/Features/Content/presentation/content.dart';
import 'package:adabeharam/Features/Prayers/repository/prayer_listview.dart';
import 'package:adabeharam/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrayerId2 extends StatelessWidget {
  static const String rn = "/Prayer2";

  final int id;

  const PrayerId2({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.appbar(
        context,
        commonController,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: DBhelper().getPrayers(id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No Data Found'));
            } else {
              final data = snapshot.data!;
              return PrayerListView(
                data: data,
                onPress: (index) async {
                  Get.toNamed(
                    ContentPage.rn,
                    parameters: {
                      'id': data[index]['id'].toString(),
                      'isPrayerPage': 'true',
                      'url': data[index]['file_name']
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
