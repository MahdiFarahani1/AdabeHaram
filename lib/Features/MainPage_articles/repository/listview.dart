import 'package:adabeharam/Core/utils/esay_size.dart';
import 'package:flutter/material.dart';

class CommonListView extends StatelessWidget {
  final dynamic data;
  final Function(int) onPress;

  const CommonListView({
    super.key,
    required this.data,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: EsaySize.width(context),
      height: EsaySize.height(context) * 0.9,
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  offset: const Offset(2, 3), color: Colors.amber.shade100)
            ]),
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4))),
              onPressed: () => onPress(index),
              child: Text(
                data[index]["title"],
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}
