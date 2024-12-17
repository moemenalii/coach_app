
import 'package:flutter/material.dart';

class CheckText extends StatelessWidget {
  const CheckText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
      child: Row(
        children: [
          const Icon(
            Icons.check_sharp,
            color: Colors.green,
          ),
          Column(
            children: [Text(text)],
          )
        ],
      ),
    );
  }
}
