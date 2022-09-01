import 'package:flutter/material.dart';
import 'package:pomodoro_timer_flutter/util/color_util.dart';
import 'package:pomodoro_timer_flutter/screens/settings/widgets/color_grid/sub-widgets/color_item.dart';

class ColorRowWidget extends StatelessWidget {
  final List<String> colors;

  const ColorRowWidget({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    List<Widget> getChildren() {
      return colors
          .map<Widget>((e) => ColourItemWidget(
                color: HexColor(e),
                selected: e == "#4A4B4F",
              ))
          .toList();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: getChildren(),
    );
  }
}