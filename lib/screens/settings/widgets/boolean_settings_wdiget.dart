import 'package:flutter/material.dart';
import 'package:pomodoro_timer_flutter/providers/user_settings_provider.dart';
import 'package:pomodoro_timer_flutter/screens/settings/widgets/sub-widgets/container_util.dart';
import 'dart:math' as math;

import 'package:provider/provider.dart';

class BooleanSettingsWidget extends StatelessWidget {
  final String label;

  const BooleanSettingsWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    //Dart with flutter doesn't support reflection, find better way to construct method
    UserSettings userSettings = context.watch<UserSettings>();
    bool getSetting(var val) {
      switch (label.toLowerCase()) {
        case "vibrate":
          if (val != null) userSettings.vibrate = val;
          return userSettings.vibrate;

        case "autostart breaks":
          if (val != null) userSettings.autoStartBreaks = val;
          return userSettings.autoStartBreaks;

        case "autostart pomodoro":
          if (val != null) userSettings.autoStartPomodoro = val;
          return userSettings.autoStartPomodoro;

        case "keep phone awake":
          if (val != null) userSettings.keepPhoneAwake = val;
          return userSettings.keepPhoneAwake;

        default:
          return false;
      }
    }

    return ContainerUtil.getContainer(
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 15),
            child: Transform.rotate(
              angle: 45 * math.pi / 180,
              child: GestureDetector(
                onTap: () => getSetting(false),
                child: Icon(
                  Icons.add_circle_rounded,
                  color: ((getSetting(null)) ? Colors.grey : Colors.white),
                  size: 48.0,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => getSetting(true),
            child: Icon(
              Icons.check_circle_rounded,
              color: ((getSetting(null)) ? Colors.white : Colors.grey),
              size: 48.0,
            ),
          ),
        ],
      ),
      label,
      null,
      userSettings.selectedColor,
    );
  }
}
