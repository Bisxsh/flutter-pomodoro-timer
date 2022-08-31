import 'package:flutter/material.dart';

class PlayPauseWidget extends StatefulWidget {
  final bool showPlay;
  final bool? invisible;

  const PlayPauseWidget({super.key, required this.showPlay, this.invisible});

  @override
  State<PlayPauseWidget> createState() => _PlayPauseWidgetState();
}

class _PlayPauseWidgetState extends State<PlayPauseWidget> {
  IconData getIcon() {
    return widget.showPlay ? Icons.play_arrow_rounded : Icons.pause_rounded;
  }

  Color getColor() {
    return (widget.invisible ?? false) ? Colors.transparent : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Icon(
        getIcon(),
        color: getColor(),
        size: 80.0,
      ),
    );
  }
}
