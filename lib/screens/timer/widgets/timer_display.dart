import 'package:flutter/material.dart';
import 'package:pomodoro_timer_flutter/providers/user_settings_provider.dart';
import 'package:pomodoro_timer_flutter/screens/timer/widgets/sub-widgets/timer_mode_display.dart';
import 'package:pomodoro_timer_flutter/screens/timer/widgets/sub-widgets/progress_widget.dart';
import 'package:pomodoro_timer_flutter/screens/timer/widgets/sub-widgets/timer_widget.dart';
import 'package:provider/provider.dart';

class TimerDisplay extends StatelessWidget {
  const TimerDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.watch<UserSettings>().selectedColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [TimerWidget(), ProgressWidget(), TimerModeDisplay()],
      ),
    );
  }
}
