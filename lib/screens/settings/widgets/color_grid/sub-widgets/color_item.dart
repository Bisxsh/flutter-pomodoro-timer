import 'package:flutter/material.dart';

class ColourItemWidget extends StatelessWidget {
  final Color color;
  const ColourItemWidget({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
      margin: const EdgeInsets.all(10),
    );
  }
}
