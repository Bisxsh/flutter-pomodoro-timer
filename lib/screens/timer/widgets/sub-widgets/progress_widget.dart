import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/user_session_provider.dart';

class ProgressWidget extends StatefulWidget {
  const ProgressWidget({super.key});

  @override
  State<ProgressWidget> createState() => _ProgressWidgetState();
}

class _ProgressWidgetState extends State<ProgressWidget> {
  @override
  Widget build(BuildContext context) {
    List<Widget> getIndicators() {
      List<Widget> indicators = [];

      for (int i = 0; i < 8; i++) {
        indicators.add(ProgressIndicator(
            active: (i < context.watch<UserSession>().pomodorosCompleted)));
        if ((i + 1) % 4 == 0 && i != 0) {
          indicators
              .add(const ProgressIndicator(active: false, invisible: true));
        }
      }

      return indicators;
    }

    return Container(
      margin: const EdgeInsets.only(left: 27),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: getIndicators(),
      ),
    );
  }
}

class ProgressIndicator extends StatelessWidget {
  const ProgressIndicator({super.key, required this.active, this.invisible});

  final bool active;
  final bool? invisible;

  Color getColor() {
    if (invisible ?? false) return Colors.transparent;
    return active ? Colors.white : Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: getColor(),
      ),
      width: 10,
      height: 10,
      margin: const EdgeInsets.fromLTRB(5, 50, 5, 0),
    );
  }
}
