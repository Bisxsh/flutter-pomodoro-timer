// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

enum TimerMode { POMODORO, BREAK, LONG_BREAK }

class UserSession with ChangeNotifier {
  String _timeRemaining = "";
  int _pomodorosCompleted = 0;
  TimerMode _mode = TimerMode.POMODORO;

  String get timeRemaining => _timeRemaining;
  int get pomodorosCompleted => _pomodorosCompleted;
  TimerMode get mode => _mode;

  set timeRemaining(String value) {
    _timeRemaining = value;
    notifyListeners();
  }

  set pomodorosCompleted(value) {
    _pomodorosCompleted = value;
    notifyListeners();
  }

  set mode(value) {
    _mode = value;
    notifyListeners();
  }
}
