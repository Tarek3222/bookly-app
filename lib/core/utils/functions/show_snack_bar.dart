import 'package:flutter/material.dart';

void showSnackBar({required BuildContext context, required String text,required Color color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 2),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(20),
      shape: const StadiumBorder(),
      dismissDirection: DismissDirection.up,
    ),
  );
}
