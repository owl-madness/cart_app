import 'package:flutter/material.dart';

class CustomWidget {
  static showSnackBar(String s, BuildContext context) {
    debugPrint(s);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          s,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
