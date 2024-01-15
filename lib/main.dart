import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'description.dart';
import 'list_with_selectable_values.dart';
import 'menu_background_element.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: AppBar(
          automaticallyImplyLeading: false, // Disable the back button
          backgroundColor: const Color(0xff03045E),
          flexibleSpace: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 50),
                child: InkWell(
                  child: const Text('repo',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'menlo',
                          fontWeight: FontWeight.normal,
                          color: Colors.white)),
                  onTap: () async {
                    final Uri url = Uri.parse('https://flutter.dev');
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  },
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.fitHeight,
                      height: 80, // Adjust the height as needed
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 50),
                child: InkWell(
                  child: const Text('about me 👉👈',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'menlo',
                          fontWeight: FontWeight.normal,
                          color: Colors.white)),
                  onTap: () async {
                    final Uri url = Uri.parse('https://flutter.dev');
                    launchUrl(url);
                  },
                ),
              )
            ],
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            // BackgroundWithCircles(
            //   backgroundColor: Color(0xff90E0EF),
            //   overlayElement: Description(),
            // ),
            // BackgroundWithCircles(
            //   backgroundColor: Color(0xff90E0EF),
            //   overlayElement:
            //       MyHorizontalTextScroll(items: ['aaaa', 'bbbbb', 'cccccc']),
            // ),
            // BackgroundWithCircles(
            //   backgroundColor: Color(0xffCAF0F8),
            //   overlayElement: Text('wdadada'),
            // ),
          ],
        ),
      ),
    ));
  }
}
