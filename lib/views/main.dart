import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jira_creator/viewModels/AppProvider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'description.dart';
import 'menu_background_element.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final provider = AppProvider();

  @override
  void initState() {
    super.initState();
    provider.addElement(const BackgroundWithCircles(
      backgroundColor: Color(0xff90E0EF),
      overlayElement: Description(),
      overlayColor: Color(0xff03045E),
    ));
    provider.addElement(
      const BackgroundWithCircles(
        backgroundColor: Color(0xff03045E),
        overlayColor: Color(0xffCAF0F8),
        overlayElement: RecommendedRows(),
      ),
    );
  }

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
        body: SingleChildScrollView(
          child: Column(
            children:
              provider.elementsList,

          ),
        ),
      ),
    );
  }
}

class RecommendedRows extends StatelessWidget {
  const RecommendedRows({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      color: const Color(0xff03045E),
      child: Column(children: [
        Text("Predefined elements for your Jira",
            style: GoogleFonts.getFont('Roboto Mono', color: Colors.white)),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PredefinedElement(
              elementName: 'Story Points (T-shirt sizes)',
              elementDescription: 'S, M, L, XL',
            ),
            PredefinedElement(
                elementName: 'Story Points (Fibonacci Series)',
                elementDescription: '1, 2, 3, 5, 8, 13'),
          ],
        )
      ]),
    );
  }
}

class PredefinedElement extends StatefulWidget {
  final String elementName;
  final String elementDescription;

  const PredefinedElement({
    super.key,
    required this.elementName,
    required this.elementDescription,
  });

  @override
  _PredefinedElementState createState() => _PredefinedElementState();
}

class _PredefinedElementState extends State<PredefinedElement> {
  final provider = AppProvider();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          provider.addElement(const BackgroundWithCircles(
              backgroundColor: Colors.brown,
              overlayColor: Colors.cyan,
              overlayElement: Text('hello')));
        });
      },
      child: Container(
        width: 300,
        height: 120,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.elementName,
              style: GoogleFonts.getFont(
                'Roboto Mono',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(widget.elementDescription),
            Container(height: 1, width: double.infinity, color: Colors.black),
            const SizedBox(height: 5),
            const Text('Add as row'),
          ],
        ),
      ),
    );
  }
}
