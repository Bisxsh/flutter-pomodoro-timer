import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

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
      _controller.start();
    } else if (_controller.isResumed) {
      _controller.pause();
      _controller.isResumed = false;
    } else {
      _controller.resume();
      _controller.isPaused = false;
    }
  }

  void resetTimer() {
    _controller.restart(duration: _startingTime);
    _controller.pause();
  }

  @override
  void dispose() {
    // _controller.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {toggleTimer()},
      onLongPress: () => {resetTimer()},
      child: CircularCountDownTimer(
        width: 250,
        height: 250,
        duration: 30,
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
        controller: _controller,
        autoStart: false,
      ),
    );
  }
}
