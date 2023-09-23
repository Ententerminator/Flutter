import 'package:flutter/material.dart';
import 'home_page.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppbar({super.key});

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
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MyHomePage()));
        },
      ),
    );
  }
}
