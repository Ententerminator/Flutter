import 'package:flutter/material.dart';

import 'appbar.dart';
import 'drawer.dart';

class GpsData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(),
      body: Center(child: Text('Hello There5')),
      endDrawer: MyDrawer(),
    );
  }
}