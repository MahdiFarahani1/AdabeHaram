import 'package:adabeharam/Core/database/db_helper.dart';
import 'package:adabeharam/Core/utils/esay_size.dart';
import 'package:flutter/material.dart';

class ContentPage extends StatelessWidget {
  final int id;
  const ContentPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: DBhelper().getContent(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No Data Found'));
          } else {
            final data = snapshot.data!;
            return SizedBox(
              width: EsaySize.width(context),
              height: EsaySize.height(context) * 0.9,
              child: Column(
                children: [
                  Text(data[0]["title"]),
                  Text(data[0]["_text"]),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
