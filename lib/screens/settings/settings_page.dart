import 'package:flutter/material.dart';
import 'package:pomodoro_timer_flutter/screens/settings/widgets/boolean_settings_wdiget.dart';
import 'package:pomodoro_timer_flutter/screens/settings/widgets/color_grid/color_grid_widget.dart';
import 'package:pomodoro_timer_flutter/screens/settings/widgets/int_settings_widget.dart';
import 'package:provider/provider.dart';

import '../../providers/user_settings_provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    UserSettings userSettings = context.watch<UserSettings>();

    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IntSettingsWidget(
                  label: "Pomodoro",
                  controller: TextEditingController(
                      text: '${userSettings.pomodoroTime}'),
                ),
                IntSettingsWidget(
                  label: "Break",
                  controller:
                      TextEditingController(text: "${userSettings.breakTime}"),
                  removeMargin: true,
                ),
                IntSettingsWidget(
                  label: "Long Break",
                  controller: TextEditingController(
                      text: "${userSettings.longBreakTime}"),
                ),
              ],
            ),
            const ColorGridWidget(),
            const BooleanSettingsWidget(label: "Vibrate"),
            const BooleanSettingsWidget(label: "Autostart Breaks"),
            const BooleanSettingsWidget(label: "Autostart Pomodoro"),
            const BooleanSettingsWidget(label: "Show Notifications"),
            const BooleanSettingsWidget(label: "Keep Phone Awake"),
          ],
        ),
      ),
    );
  }
}
