import 'package:flutter/material.dart';
import 'accelerometer.dart';
import 'camera.dart';
import 'contacts.dart';
import 'drawer.dart';
import 'file_access.dart';
import 'gps_data.dart';
import 'retrieve_data.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Example App Flutter'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              child: const Text('NewPage1'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewPage1()));
              },
            ),
            ElevatedButton(
              child: const Text('NewPage2'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewPage2()));
              },
            ),
            ElevatedButton(
              child: const Text('NewPage3'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewPage3()));
              },
            ),
            ElevatedButton(
              child: const Text('NewPage4'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewPage4()));
              },
            ),
            ElevatedButton(
              child: const Text('NewPage5'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewPage5()));
              },
            ),
            ElevatedButton(
              child: const Text('NewPage6'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewPage6()));
              },
            ),
          ],
        ),
      ),
      endDrawer: MyDrawer(),
    );
  }
}
