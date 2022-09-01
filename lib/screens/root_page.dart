import 'package:flutter/material.dart';
import 'package:pomodoro_timer_flutter/providers/user_session_provider.dart';
import 'package:pomodoro_timer_flutter/providers/user_settings_provider.dart';
import 'package:pomodoro_timer_flutter/components/menu_widget_anim.dart';
import 'package:pomodoro_timer_flutter/screens/settings/settings_page.dart';
import 'package:pomodoro_timer_flutter/screens/timer/timer_page.dart';
import 'package:provider/provider.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  bool timerShown = true;
  List<Widget> pages = [const TimerPage(), const SettingsPage()];

  void togglePage() {
    setState(() {
      timerShown = !timerShown;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.watch<UserSettings>().selectedColor,
        toolbarHeight: 0,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: context.watch<UserSettings>().selectedColor,
        child: Column(
          children: [
            AnimMenuWidget(onPress: togglePage),
            MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_) => UserSession()),
              ],
              child: Expanded(child: pages[timerShown ? 0 : 1]),
            ),
          ],
        ),
      ),
    );
  }
}
