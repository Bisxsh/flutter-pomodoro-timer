import 'package:flutter/material.dart';
import 'package:pomodoro_timer_flutter/providers/user_settings_provider.dart';
import 'package:pomodoro_timer_flutter/util/color_util.dart';
import 'package:provider/provider.dart';

class ColourItemWidget extends StatelessWidget {
  final String color;
  final bool selected;
  const ColourItemWidget(
      {super.key, required this.color, required this.selected});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
            color: HexColor(color), borderRadius: BorderRadius.circular(5)),
        margin: const EdgeInsets.all(7),
      ),
    ];

    List<Widget> getChildren() {
      if (!selected) return children;
      children.add(const Icon(
        Icons.check_circle,
        color: Colors.white,
        size: 32.0,
      ));
      return children;
    }

    return GestureDetector(
      onTap: () {
        Provider.of<UserSettings>(context, listen: false).selectedColor = color;
      },
      child: Stack(
        alignment: Alignment.center,
        children: getChildren(),
      ),
    );
  }
}
