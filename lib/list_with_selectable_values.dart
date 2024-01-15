import 'package:flutter/material.dart';

class MyHorizontalTextScroll extends StatelessWidget {
  final List<String> items;

  const MyHorizontalTextScroll({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120, // Set a fixed height for the container
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: items.map((item) {
          return Container(
            width: 150, // Set a fixed width for each item
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    item,
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
