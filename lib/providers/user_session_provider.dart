// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

enum TimerMode { POMODORO, BREAK, LONG_BREAK }

class UserSession with ChangeNotifier {
  final String _timeRemaining = "";
  final int _pomodorosCompleted = 0;
  TimerMode mode = TimerMode.POMODORO;
}
