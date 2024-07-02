import 'package:adabeharam/Core/widget/appbar.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  static const String rn = "/AboutUs";
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppbar.littleAppbar(context),
            const Card(
              margin: EdgeInsets.all(8),
              child: Padding(
                padding: EdgeInsets.all(14.0),
                child: Text(
                  "التطبيق مستل من كتاب (آداب الحرمين) للسيد جواد الحسيني آل علي الشاهرودي، الذي يعد من أهم وأشهر كتب الزيارات وآدابها والأدعية والأعمال الخاصة بمكة المكرمة والمدينة المنورة والأماكن في أطرافهما.",
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
