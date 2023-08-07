import 'package:flutter/material.dart';
const primaryColor = Color(0xFFffffff);
const secondaryColor = Colors.blue;
const defaultPadding = 10.0;

String? token = '';
String? uId = '';

void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
