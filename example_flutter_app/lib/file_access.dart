import 'package:flutter/material.dart';

import 'appbar.dart';
import 'drawer.dart';

class FileAccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(),
      body: Center(child: Text('Hello There4')),
      endDrawer: MyDrawer(),
    );
  }
}
