import 'package:flutter/material.dart';

class AnimMenuWidget extends StatefulWidget {
  final VoidCallback onPress;

  const AnimMenuWidget({super.key, required this.onPress});

  @override
  State<AnimMenuWidget> createState() => _AnimMenuWidgetState();
}

class _AnimMenuWidgetState extends State<AnimMenuWidget>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController? _animationController;
  Animation<double>? _animateIcon;
  final Curve _curve = Curves.easeOut;

  @override
  initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..addListener(() {
        setState(() {});
      });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController!);
    super.initState();
  }

  @override
  dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  animate() {
    widget.onPress();
    if (!isOpened) {
      _animationController?.forward();
    } else {
      _animationController?.reverse();
    }
    isOpened = !isOpened;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 15, top: 15),
      child: Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: animate,
          child: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            color: Colors.white,
            progress: _animateIcon!,
          ),
        ),
      ),
    );
  }
}
