import 'package:flutter/material.dart';

class ProgressWidget extends StatefulWidget {
  const ProgressWidget({super.key});

  @override
  State<ProgressWidget> createState() => _ProgressWidgetState();
}

class _ProgressWidgetState extends State<ProgressWidget> {
  int sessionsCompleted = 0;

  List<Widget> getIndicators() {
    List<Widget> indicators = [];

    for (int i = 0; i < 8; i++) {
      indicators.add(ProgressIndicator(active: (i < sessionsCompleted)));
      if ((i + 1) % 4 == 0 && i != 0) {
        indicators.add(const ProgressIndicator(active: false, invisible: true));
      }
    }

    return indicators;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: getIndicators(),
    );
  }
}

class ProgressIndicator extends StatelessWidget {
  const ProgressIndicator({super.key, required this.active, this.invisible});

  final bool active;
  final bool? invisible;

  Color getColor() {
    debugPrint('$invisible');
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
