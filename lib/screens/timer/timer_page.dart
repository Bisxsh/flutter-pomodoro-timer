import 'package:flutter/material.dart';
import 'package:pomodoro_timer_flutter/util/color_util.dart';
import 'package:pomodoro_timer_flutter/screens/timer/widgets/timer_display.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => TimerPageState();
}

class TimerPageState extends State<TimerPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      color: HexColor.getBackgroundColor(),
      child: const Align(
        alignment: Alignment.center,
        child: TimerDisplay(),
      ),
    );
  }
}
