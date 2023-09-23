import 'package:flutter/material.dart';

import 'accelerometer.dart';
import 'camera.dart';
import 'contacts.dart';
import 'file_access.dart';
import 'gps_data.dart';
import 'home_page.dart';
import 'retrieve_data.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('MyHomePage'),
            selected: runtimeType.toString() == 'MyHomePage',
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()));
            },
          ),
          ListTile(
            title: const Text('NewPage1'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => NewPage1()));
            },
          ),
          ListTile(
            title: const Text('NewPage2'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => NewPage2()));
            },
          ),
          ListTile(
            title: const Text('NewPage3'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => NewPage3()));
            },
          ),
          ListTile(
            title: const Text('NewPage4'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => NewPage4()));
            },
          ),
          ListTile(
            title: const Text('NewPage5'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => NewPage5()));
            },
          ),
          ListTile(
            title: const Text('NewPage6'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => NewPage6()));
            },
          ),
        ],
      ),
    );
  }
}
