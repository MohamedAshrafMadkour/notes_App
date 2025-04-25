import 'package:flutter/material.dart';

void snakeBarShow(BuildContext context, String textShow) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.black,
      content: Text(textShow, style: const TextStyle(color: Colors.blueAccent)),
    ),
  );
}
