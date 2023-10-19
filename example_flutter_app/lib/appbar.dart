import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'current_page.dart';
import 'home_page.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  String text;
  MyAppbar(this.text);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(text),
      centerTitle: true,
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
