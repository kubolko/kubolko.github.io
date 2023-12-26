import 'package:flutter/material.dart';

class BackgroundWithCircles extends StatelessWidget {
  final Color backgroundColor;
  final Color overlayColor;
  final Widget overlayElement;

  const BackgroundWithCircles({
    super.key,
    required this.backgroundColor,
    required this.overlayColor,
    required this.overlayElement,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: backgroundColor,
          width: double.infinity,
          child: overlayElement,
        ),
        Container(
          color: overlayColor,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              12,
              (index) => HalfCircleWidget(
                color: backgroundColor,
                overlayColor: overlayColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class HalfCircleWidget extends StatelessWidget {
  final Color color;
  final Color overlayColor;

  const HalfCircleWidget(
      {super.key, required this.color, required this.overlayColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 12,
      height: MediaQuery.of(context).size.width / 24,
      // Half of the circle's height
      decoration: BoxDecoration(
        color: color, // Use the provided color
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(100),
          bottomRight: Radius.circular(100),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: double.infinity,
          color: color, // Change the color as needed
        ),
      ),
    );
  }
}
