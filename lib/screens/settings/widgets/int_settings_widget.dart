import 'package:flutter/material.dart';
import 'package:pomodoro_timer_flutter/screens/settings/widgets/sub-widgets/container_util.dart';

class IntSettingsWidget extends StatelessWidget {
  final String label;

  const IntSettingsWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return ContainerUtil.getContainer(
        SizedBox(
          width: 50,
          child: TextFormField(
            style: const TextStyle(color: Colors.white, fontSize: 40),
            decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                hintText: "25",
                hintStyle: TextStyle(color: Colors.grey),
                labelStyle: TextStyle(color: Colors.white)),
          ),
        ),
        label);
  }
}
