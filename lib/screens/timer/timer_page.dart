import 'package:flutter/material.dart';
import 'package:pomodoro_timer_flutter/components/color_util.dart';
import 'package:pomodoro_timer_flutter/components/countdown_timer/timer_display.dart';
import 'package:pomodoro_timer_flutter/screens/timer/widgets/menu_widget.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => TimerPageState();
}

class TimerPageState extends State<TimerPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor.getBackgroundColor(),
      child: Column(
        children: const [
          MenuWidget(),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: TimerDisplay(),
            ),
          ),
        ],
      ),
    );
  }
}
