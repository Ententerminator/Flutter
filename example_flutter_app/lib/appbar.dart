import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'current_page.dart';
import 'home_page.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Example App Flutter'),
      leading: IconButton(
        icon: const BackButtonIcon(),
        tooltip: 'Back Button',
        onPressed: () {
          HapticFeedback.vibrate();
          CurrentPage.setPage('MyHomePage');
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyHomePage()));
        },
      ),
    );
  }
}
