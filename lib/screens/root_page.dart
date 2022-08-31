import 'package:flutter/material.dart';
import 'package:pomodoro_timer_flutter/components/color_util.dart';
import 'package:pomodoro_timer_flutter/components/menu_widget_anim.dart';
import 'package:pomodoro_timer_flutter/screens/settings/settings_page.dart';
import 'package:pomodoro_timer_flutter/screens/timer/timer_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  bool timerShown = true;
  List<Widget> pages = [const TimerPage(), const SettingsPage()];

  void togglePage() {
    debugPrint("HERE");
    setState(() {
      timerShown = !timerShown;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor.getBackgroundColor(),
        toolbarHeight: 0,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: HexColor.getBackgroundColor(),
        child: Column(
          children: [
            AnimMenuWidget(onPress: togglePage),
            Expanded(child: pages[timerShown ? 0 : 1]),
          ],
        ),
      ),
    );
  }
}
