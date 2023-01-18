import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, {required String text}) {
  ScaffoldMessenger.of(context)
    ..clearSnackBars
    ..showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
}
