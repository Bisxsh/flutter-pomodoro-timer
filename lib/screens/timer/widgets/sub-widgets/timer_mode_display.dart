import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/user_session_provider.dart';

extension on TimerMode {
  String toFormattedString() {
    if (this == TimerMode.LONG_BREAK) return "LONG BREAK";
    return toString().split(".").last;
  }
}

class TimerModeDisplay extends StatelessWidget {
  const TimerModeDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            context.watch<UserSession>().mode.toFormattedString(),
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
