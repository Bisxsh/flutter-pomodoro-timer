import 'package:flutter/material.dart';
import 'package:pomodoro_timer_flutter/screens/settings/widgets/sub-widgets/container_util.dart';
import 'dart:math' as math;

class BooleanSettingsWidget extends StatelessWidget {
  final String label;

  const BooleanSettingsWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return ContainerUtil.getContainer(
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 15),
            child: Transform.rotate(
              angle: 45 * math.pi / 180,
              child: const Icon(
                Icons.add_circle_rounded,
                color: Colors.white,
                size: 48.0,
              ),
            ),
          ),
          const Icon(
            Icons.check_circle_rounded,
            color: Colors.white,
            size: 48.0,
          ),
        ],
      ),
      "Vibrate",
      null,
    );
  }
}
