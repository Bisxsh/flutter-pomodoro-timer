import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro_timer_flutter/screens/timer/widgets/sub-widgets/play_pause_widget.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  String timeRemaining = "";
  final int _startingTime = 30;
  final CountDownController _controller = CountDownController();

  void toggleTimer() {
    if (!_controller.isStarted) {
      _controller.restart(duration: 30);

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

  void resetTimer() {
    _controller.reset();
    _controller.isPaused = false;
    _controller.isResumed = false;
  }

  @override
  void dispose() {
    // _controller.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: GestureDetector(
        onTap: () => {toggleTimer()},
        onLongPress: () => {resetTimer()},
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
              duration: 30,
              autoStart: false,
              initialDuration: 30,
              fillColor: Colors.white,
              ringColor: Colors.grey,
              isReverse: true,
              isReverseAnimation: true,
              strokeWidth: 10.0,
              strokeCap: StrokeCap.round,
              textFormat: "mm:ss",
              textStyle: const TextStyle(color: Colors.transparent),
              onChange: (String timeStamp) {
                timeRemaining = timeStamp;
              },
              onComplete: () {
                setState(() {
                  _controller.reset();
                  _controller.isStarted = false;
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
