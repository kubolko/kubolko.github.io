import 'package:flutter/material.dart';

class ListElement extends StatefulWidget {
  final Key key;
  final String text;
  final Color color;
  final VoidCallback onPressed;
  final VoidCallback onDelete;

  ListElement({
    required this.key,
    required this.text,
    required this.color,
    required this.onPressed,
    required this.onDelete,
  }) : super(key: key);

  @override
  _ListElementState createState() => _ListElementState();
}

class _ListElementState extends State<ListElement> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.text);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0077B6),
            minimumSize: const Size(125, 70),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          child: TextFormField(
            controller: _textEditingController,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: 'menlo',
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
        GestureDetector(
          onTap: widget.onDelete,
          child: Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFD9D9D9),
            ),
            child: const Center(
              child: Text(
                '💀', // Skull emoji
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
