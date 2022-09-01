import 'package:flutter/material.dart';
import 'package:pomodoro_timer_flutter/util/color_util.dart';
import 'package:pomodoro_timer_flutter/screens/timer/widgets/sub-widgets/progress_widget.dart';
import 'package:pomodoro_timer_flutter/screens/timer/widgets/sub-widgets/timer_widget.dart';

class TimerDisplay extends StatelessWidget {
  const TimerDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor.getBackgroundColor(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [TimerWidget(), ProgressWidget()],
      ),
    );
  }
}
