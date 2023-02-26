import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  TextWidget({
    Key? key,
    required this.text,
    required this.color,
    this.textSize = 16,
    this.isTitle = false,
    this.maxLines = 10,
  }) : super(key: key);

  final String text;
  final Color color;
  final double textSize;
  bool isTitle;
  int maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        color: color,
        fontSize: textSize,
        fontWeight: isTitle ? FontWeight.w600 : FontWeight.w400,
      ),
    );
  }
}
