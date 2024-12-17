
import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  const TextCustom({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
    );
  }
}
 