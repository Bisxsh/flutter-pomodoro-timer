import 'package:flutter/material.dart';
import 'dart:async';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  Timer _timer = Timer(const Duration(seconds: 0), () {});
  double _timePercentage = 0.5;
  int _timeRemaining = 30;
  final int _startingTime = 30;

  void startTimer() {
    if (_timer.isActive) {
      pauseTimer();
      return;
    }
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        debugPrint('Time Remaining: ${(_timePercentage)}');
        if (_timeRemaining == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _timeRemaining--;
            _timePercentage = _timeRemaining / _startingTime;
          });
        }
      },
    );
  }

  void pauseTimer() {
    _timer.cancel();
  }

  void resetTimer() {
    pauseTimer();
    setState(() {
      _timeRemaining = _startingTime;
      _timePercentage = 1.0;
    });
  }

  @override
  void dispose() {
    resetTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO wrap in animatedBuilder maybe
    return GestureDetector(
      onTap: () => {startTimer()},
      onLongPress: () => {resetTimer()},
      child: Container(
        width: 250,
        height: 250,
        margin: const EdgeInsets.all(50),
        child: CircularProgressIndicator(
          semanticsLabel: "Time Remaining",
          semanticsValue: '${(_timeRemaining)} seconds',
          strokeWidth: 10.0,
          color: Colors.white,
          backgroundColor: Colors.grey,
          value: _timePercentage,
        ),
      ),
    );
  }
}
