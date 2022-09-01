import 'package:flutter/material.dart';
import 'package:pomodoro_timer_flutter/screens/settings/widgets/sub-widgets/text_util.dart';
import 'package:pomodoro_timer_flutter/util/color_util.dart';

class ContainerUtil {
  static getContainer(
      Widget child, String? message, bool? removeMargin, Color color) {
    getChild() {
      if (message != null) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            child,
            Align(
              alignment: Alignment.bottomCenter,
              child: TextUtil.getOptionText(message),
            ),
          ],
        );
      }

      return child;
    }

    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 100),
      child: Container(
        margin: EdgeInsets.all((removeMargin ?? false) ? 0 : 10.0),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: HexColor.changeColorHue(color),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: getChild(),
      ),
    );
  }
}
