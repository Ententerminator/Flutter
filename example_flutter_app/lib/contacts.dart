import 'package:flutter/material.dart';

import 'appbar.dart';
import 'drawer.dart';

class Contacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(),
      body: Center(child: Text('Hello There3')),
      endDrawer: MyDrawer(),
    );
  }
}
