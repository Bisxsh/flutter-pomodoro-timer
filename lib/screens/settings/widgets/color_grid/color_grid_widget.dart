import 'package:flutter/material.dart';
import 'package:pomodoro_timer_flutter/screens/settings/widgets/color_grid/sub-widgets/color_row.dart';
import 'package:pomodoro_timer_flutter/screens/settings/widgets/sub-widgets/container_util.dart';
import 'package:provider/provider.dart';
import '../../../../providers/user_settings_provider.dart';
import 'sub-widgets/colors.dart';

class ColorGridWidget extends StatelessWidget {
  const ColorGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> getRows() {
      List<Widget> rows = [];
      for (int i = 0; i < COLORS.length; i = i + 5) {
        rows.add(ColorRowWidget(colors: COLORS.sublist(i, i + 5)));
      }
      return rows;
    }

    return ContainerUtil.getContainer(
      Column(children: getRows()),
      null,
      null,
      context.watch<UserSettings>().selectedColor,
    );
  }
}
