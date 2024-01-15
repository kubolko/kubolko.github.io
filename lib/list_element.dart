import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;
  final VoidCallback onDelete;

  CustomButton({super.key,
    required this.text,
    required this.color,
    required this.onPressed,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0077B6),
            minimumSize: const Size(125, 70),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: 'menlo',
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
        ),
        GestureDetector(
          onTap: onDelete,
          child: Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color:
                  Color(0xFFD9D9D9), // You can change the color of the circle
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
}
