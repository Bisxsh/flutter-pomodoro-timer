import 'package:flutter/material.dart';
import 'package:pomodoro_timer_flutter/providers/user_settings_provider.dart';
import 'package:pomodoro_timer_flutter/screens/settings/widgets/sub-widgets/container_util.dart';
import 'package:provider/provider.dart';

import '../../../providers/user_session_provider.dart';

class IntSettingsWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool? removeMargin;

  const IntSettingsWidget(
      {super.key,
      required this.label,
      required this.controller,
      this.removeMargin});

  @override
  Widget build(BuildContext context) {
    TimerMode mode = TimerMode.values.firstWhere(
        (e) => e.toString().contains(label.substring(0, 3).toUpperCase()));
    UserSettings userSettings = context.watch<UserSettings>();

    void setValue(String text) {
      if (text.isEmpty) return;
      int n = int.parse(text);
      switch (mode) {
        case TimerMode.POMODORO:
          userSettings.pomodoroTime = n;
          break;

        case TimerMode.BREAK:
          userSettings.breakTime = n;
          break;

        case TimerMode.LONG_BREAK:
          userSettings.longBreakTime = n;
          break;
      }
    }

    return ContainerUtil.getContainer(
        SizedBox(
          width: 50,
          child: TextFormField(
            keyboardType: TextInputType.number,
            onFieldSubmitted: (text) => {setValue(text)},
            style: const TextStyle(color: Colors.white, fontSize: 30),
            controller: controller,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                hintText: "25",
                hintStyle: TextStyle(color: Colors.grey),
                labelStyle: TextStyle(color: Colors.white)),
          ),
        ),
        label,
        removeMargin);
  }
}
