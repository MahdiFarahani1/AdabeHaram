import 'package:flutter/material.dart';

class CommonListView extends StatelessWidget {
  final List<dynamic> data;
  final Function(int) onPress;

  const CommonListView({
    Key? key,
    required this.data,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.9,
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 14,
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
              child: InkWell(
                onTap: () => onPress(index),
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    data[index]["title"],
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
    );
  }
}
