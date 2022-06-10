import 'package:flutter/material.dart';

class TextInfo {
  String text;
  double left;
  double top;
  Color color;
  FontWeight fontWeight;
  FontStyle fontStyle;
  double fontsize;
  TextAlign textAlign;
  TextInfo({
    required this.text,
    required this.left,
    required this.top,
    required this.color,
    required this.fontStyle,
    required this.fontWeight,
    required this.fontsize,
    required this.textAlign,
  });
}
