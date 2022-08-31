import 'package:flutter/material.dart';
import 'package:pomodoro_timer_flutter/components/color_util.dart';
import 'package:pomodoro_timer_flutter/screens/settings/widgets/sub-widgets/text_util.dart';

class ContainerUtil {
  static getContainer(Widget child, String message) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: HexColor("#3F3F41"),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          child,
          Align(
              alignment: Alignment.bottomCenter,
              child: TextUtil.getOptionText(message)),
        ],
      ),
    );
  }
}
