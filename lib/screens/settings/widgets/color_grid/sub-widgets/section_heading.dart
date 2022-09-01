import 'package:flutter/material.dart';

class SettingsSectionHeading extends StatelessWidget {
  final String label;

  const SettingsSectionHeading({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Text(
        label.toUpperCase(),
        style: const TextStyle(color: Colors.grey, fontSize: 12),
      ),
    );
  }
}
