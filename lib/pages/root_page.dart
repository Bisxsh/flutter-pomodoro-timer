import 'package:flutter/material.dart';
import 'package:pomodoro_timer_flutter/pages/timer_page.dart';
import 'package:pomodoro_timer_flutter/components/color_util.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  List<Widget> pages = [const TimerPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#4a4b4f'),
        toolbarHeight: 0,
      ),
      body: pages[currentPage],
    );
  }
}