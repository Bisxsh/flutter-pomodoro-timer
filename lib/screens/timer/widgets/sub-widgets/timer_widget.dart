import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro_timer_flutter/providers/user_session_provider.dart';
import 'package:pomodoro_timer_flutter/providers/user_settings_provider.dart';
import 'package:pomodoro_timer_flutter/screens/timer/widgets/sub-widgets/play_pause_widget.dart';
import 'package:provider/provider.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  String timeRemaining = "";
  final CountDownController _controller = CountDownController();

  void toggleTimer(int time) {
    if (!_controller.isStarted) {
      _controller.restart(duration: time);

      setState(() {
        _controller.isStarted = true;
        _controller.isResumed = true;
      });
      return;
    } else if (_controller.isResumed) {
      _controller.pause();

      setState(() {
        _controller.isResumed = false;
      });
    } else {
      _controller.resume();

      setState(() {
        _controller.isPaused = false;
      });
    }
  }

  void resetTimer(int time, bool autoStartNext) {
    _controller.restart(duration: time);
    _controller.isPaused = false;
    _controller.isResumed = autoStartNext;
    if (!autoStartNext) {
      _controller.pause();
    }
  }

  TimerMode getNextMode(TimerMode mode, int sessionsComplete) {
    if (mode != TimerMode.POMODORO) {
      return TimerMode.POMODORO;
    }

    if (sessionsComplete % 4 == 0) return TimerMode.LONG_BREAK;
    return TimerMode.BREAK;
  }

  @override
  Widget build(BuildContext context) {
    UserSettings userSettings = context.watch<UserSettings>();
    UserSession userSession = context.watch<UserSession>();

    int pomodoroTime = userSettings.pomodoroTime * 1;
    int breakTime = userSettings.breakTime * 1;
    int longBreakTime = userSettings.longBreakTime * 1;

    TimerMode mode = userSession.mode;

    int getCurrentTime(TimerMode mode) {
      switch (mode) {
        case TimerMode.POMODORO:
          return pomodoroTime;
        case TimerMode.BREAK:
          return breakTime;
        case TimerMode.LONG_BREAK:
          return longBreakTime;
      }
    }

    bool shouldAutoStart() {
      if (mode == TimerMode.POMODORO) return userSettings.autoStartBreaks;
      return userSettings.autoStartPomodoro;
    }

    return Container(
      padding: const EdgeInsets.all(20),
      child: GestureDetector(
        onTap: () => {toggleTimer(getCurrentTime(mode))},
        onLongPress: () => {resetTimer(getCurrentTime(mode), false)},
        child: Stack(
          alignment: Alignment.center,
          children: [
            PlayPauseWidget(
              showPlay: (!_controller.isStarted),
              invisible: (_controller.isStarted && _controller.isResumed),
            ),
            CircularCountDownTimer(
              width: 250,
              height: 250,
              duration: getCurrentTime(mode),
              autoStart: false,
              fillColor: Colors.white,
              ringColor: Colors.grey,
              isReverse: true,
              isReverseAnimation: true,
              strokeWidth: 10.0,
              strokeCap: StrokeCap.round,
              textFormat: "mm:ss",
              textStyle: const TextStyle(color: Colors.white),
              onChange: (String timeStamp) {
                timeRemaining = timeStamp;
              },
              onComplete: () {
                int newPomodorosCompleted = userSession.pomodorosCompleted;
                if (mode == TimerMode.POMODORO) newPomodorosCompleted++;
                TimerMode newMode =
                    getNextMode(userSession.mode, newPomodorosCompleted);
                setState(() {
                  userSession.pomodorosCompleted = newPomodorosCompleted;
                  userSession.mode = newMode;
                  resetTimer(getCurrentTime(newMode), shouldAutoStart());
                });
              },
              controller: _controller,
            ),
          ],
        ),
      ),
    );
  }
}
