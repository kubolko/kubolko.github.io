import 'package:flutter/material.dart';

class IfInclude extends StatefulWidget {
  final bool included;
  final Key key;

  const IfInclude({
    required this.included,
    required this.key,
  }) : super(key: key);

  @override
  _IfIncludeState createState() => _IfIncludeState();
}

class _IfIncludeState extends State<IfInclude> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset('assets/do_include.png',
              fit: BoxFit.fitHeight,
              height: 80,),
            SizedBox(width: 40),
            Image.asset('assets/do_not_include.webp',
              fit: BoxFit.fitHeight,
              height: 80,),
          ],
        ),
        Text('Include?'),
      ],
    );
  }
}