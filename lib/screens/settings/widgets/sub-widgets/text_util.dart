import 'package:flutter/material.dart';
import 'package:pomodoro_timer_flutter/components/color_util.dart';

class TextUtil {
  static Container getOptionText(String message) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Text(
        message.toUpperCase(),
        style: TextStyle(
            color: HexColor("#A3A6B3"),
            fontSize: 14.0,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}