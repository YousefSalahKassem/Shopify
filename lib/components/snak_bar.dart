import 'package:flutter/material.dart';

enum SnackBarType { Error, Success }

class GlobalSnackBar {
  static showSnackbar(
      BuildContext context, String message, SnackBarType type) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor:
      type == SnackBarType.Error ? Colors.red[900] : Colors.blue[700],
      content: Text(
        message,
        style: const TextStyle(fontSize: 15),
      ),
    ));
  }
}