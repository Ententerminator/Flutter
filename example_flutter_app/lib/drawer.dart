import 'package:flutter/material.dart';

import 'accelerometer.dart';
import 'camera.dart';
import 'contacts.dart';
import 'current_page.dart';
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
          //TODO: entfernen, aber genug platz trotzdem lassen (wie in react native?)
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Ihre Werbung könnte hier stehen'),
          ),
          ListTile(
            title: const Text('MyHomePage'),
            selected: runtimeType.toString() == 'MyHomePage',
            onTap: () {
              CurrentPage.setPage('MyHomePage');
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyHomePage()));
            },
          ),
          ListTile(
            title: const Text('Accelerometer'),
            onTap: () {
              CurrentPage.setPage('Accelerometer');
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Accelerometer()));
            },
          ),
          ListTile(
            title: const Text('Camera'),
            onTap: () {
              CurrentPage.setPage('Camera');
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Camera()));
            },
          ),
          ListTile(
            title: const Text('Contacts'),
            onTap: () {
              CurrentPage.setPage('Contacts');
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Contacts()));
            },
          ),
          ListTile(
            title: const Text('FileAccess'),
            onTap: () {
              CurrentPage.setPage('FileAccess');
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FileAccess()));
            },
          ),
          ListTile(
            title: const Text('GpsData'),
            onTap: () {
              CurrentPage.setPage('GpsData');
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => GpsData()));
            },
          ),
          ListTile(
            title: const Text('RetrieveData'),
            onTap: () {
              CurrentPage.setPage('RetrieveData');
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RetrieveData()));
            },
          ),
        ],
      ),
    );
  }
}
