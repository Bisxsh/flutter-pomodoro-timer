import 'package:flutter/material.dart';
import 'package:pomodoro_timer_flutter/screens/settings/widgets/boolean_settings_wdiget.dart';
import 'package:pomodoro_timer_flutter/screens/settings/widgets/color_grid/color_grid_widget.dart';
import 'package:pomodoro_timer_flutter/screens/settings/widgets/int_settings_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
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
                  controller: TextEditingController(text: "25"),
                ),
                IntSettingsWidget(
                  label: "Break",
                  controller: TextEditingController(text: "5"),
                  removeMargin: true,
                ),
                IntSettingsWidget(
                  label: "Long Break",
                  controller: TextEditingController(text: "15"),
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
