import 'package:flutter/material.dart';
import 'package:pomodoro_timer_flutter/screens/settings/widgets/int_settings_widget.dart';
import 'package:pomodoro_timer_flutter/screens/settings/widgets/sub-widgets/container_util.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: const [
      IntSettingsWidget(label: "Pomodoro"),
    ]);
  }
}
