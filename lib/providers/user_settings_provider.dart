import 'package:flutter/material.dart';

class UserSettings with ChangeNotifier {
  int _pomodoroTime = 25, _breakTime = 5, _longBreakTime = 15;
  String _selectedColor = '#4A4B4F';
  bool _vibrate = true,
      _autoStartBreaks = true,
      _autoStartPomodoro = false,
      _showNotifications = true,
      _keepPhoneAwake = true;

  int get pomodoroTime => _pomodoroTime;
  int get breakTime => _breakTime;
  int get longBreakTime => _longBreakTime;
  String get selectedColor => _selectedColor;
  bool get vibrate => _vibrate;
  bool get autoStartBreaks => _autoStartBreaks;
  bool get autoStartPomodoro => _autoStartPomodoro;
  bool get showNotifications => _showNotifications;
  bool get keepPhoneAwake => _keepPhoneAwake;

  set setPomodoroTime(int value) {
    _pomodoroTime = value;
  }

  set setBreakTime(int value) {
    _breakTime = value;
  }

  set setLongBreakTime(int value) {
    _longBreakTime = value;
  }

  set setSelectedColor(selectedColor) {
    _selectedColor = selectedColor;
    notifyListeners();
  }

  set setVibrate(vibrate) {
    _vibrate = vibrate;
    notifyListeners();
  }

  set setAutoStartBreaks(autoStartBreaks) {
    _autoStartBreaks = autoStartBreaks;
    notifyListeners();
  }

  set setAutoStartPomodoro(autoStartPomodoro) {
    _autoStartPomodoro = autoStartPomodoro;
    notifyListeners();
  }

  set setShowNotifications(showNotifications) {
    _showNotifications = showNotifications;
    notifyListeners();
  }

  set setKeepPhoneAwake(keepPhoneAwake) {
    _keepPhoneAwake = keepPhoneAwake;
    notifyListeners();
  }
}
