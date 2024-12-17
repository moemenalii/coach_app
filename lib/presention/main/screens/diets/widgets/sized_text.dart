import 'package:flutter/material.dart';

class SizedText extends StatelessWidget {
  const SizedText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0));
  }
}
