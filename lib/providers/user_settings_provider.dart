import 'package:flutter/material.dart';
import 'package:pomodoro_timer_flutter/util/color_util.dart';

class UserSettings with ChangeNotifier {
  //TODO testing values, revert
  int _pomodoroTime = 1, _breakTime = 2, _longBreakTime = 4;
  String _selectedColor = '#4A4B4F';
  bool _vibrate = true,
      _autoStartBreaks = true,
      _autoStartPomodoro = false,
      _showNotifications = true,
      _keepPhoneAwake = true;

  int get pomodoroTime => _pomodoroTime;
  int get breakTime => _breakTime;
  int get longBreakTime => _longBreakTime;
  Color get selectedColor => HexColor(_selectedColor);
  bool get vibrate => _vibrate;
  bool get autoStartBreaks => _autoStartBreaks;
  bool get autoStartPomodoro => _autoStartPomodoro;
  bool get showNotifications => _showNotifications;
  bool get keepPhoneAwake => _keepPhoneAwake;

  set pomodoroTime(int value) {
    _pomodoroTime = value;
    notifyListeners();
  }

  set breakTime(int value) {
    _breakTime = value;
    notifyListeners();
  }

  set longBreakTime(int value) {
    _longBreakTime = value;
    notifyListeners();
  }

  set selectedColor(selectedColor) {
    _selectedColor = selectedColor;
    notifyListeners();
  }

  set vibrate(vibrate) {
    _vibrate = vibrate;
    notifyListeners();
  }

  set autoStartBreaks(autoStartBreaks) {
    _autoStartBreaks = autoStartBreaks;
    notifyListeners();
  }

  set autoStartPomodoro(autoStartPomodoro) {
    _autoStartPomodoro = autoStartPomodoro;
    notifyListeners();
  }

  set showNotifications(showNotifications) {
    _showNotifications = showNotifications;
    notifyListeners();
  }

  set keepPhoneAwake(keepPhoneAwake) {
    _keepPhoneAwake = keepPhoneAwake;
    notifyListeners();
  }
}
