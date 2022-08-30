import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: IconButton(
        onPressed: () {
          debugPrint('working');
        },
        icon: const Icon(
          Icons.menu_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
