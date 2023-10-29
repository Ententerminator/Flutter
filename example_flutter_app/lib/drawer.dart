import 'dart:async';

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
  final String name;
  MyDrawer(this.name){print(name);}

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 238, 238, 238),
      child: SafeArea(  
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              trailing: const Icon(Icons.home),
              title: const Text('MyHomePage'),
              selected: name == 'MyHomePage',
              selectedColor: Theme.of(context).colorScheme.primary,
              onTap: () {
                unawaited(CurrentPage.setPage('MyHomePage'));
                Navigator.pop(context);
                unawaited(Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyHomePage())));
              },
            ),
            ListTile(
              title: const Text('Accelerometer'),
              selected: name == 'Accelerometer',
              selectedColor: Theme.of(context).colorScheme.primary,
              onTap: () {
                unawaited(CurrentPage.setPage('Accelerometer'));
                Navigator.pop(context);
                unawaited(Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Accelerometer())));
              },
            ),
            ListTile(
              trailing: const Icon(Icons.photo_camera),
              title: const Text('Camera'),
              selected: name == 'Camera',
              selectedColor: Theme.of(context).colorScheme.primary,
              onTap: () {
                unawaited(CurrentPage.setPage('Camera'));
                Navigator.pop(context);
                unawaited(Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => Camera())));
              },
            ),
            ListTile(
              trailing: const Icon(Icons.group),
              title: const Text('Contacts'),
              selected: name == 'Contacts',
              selectedColor: Theme.of(context).colorScheme.primary,
              onTap: () {
                unawaited(CurrentPage.setPage('Contacts'));
                Navigator.pop(context);
                unawaited(Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Contacts())));
              },
            ),
            ListTile(
              trailing: const Icon(Icons.folder),
              title: const Text('FileAccess'),
              selected: name == 'FileAccess',
              selectedColor: Theme.of(context).colorScheme.primary,
              onTap: () {
                unawaited(CurrentPage.setPage('FileAccess'));
                Navigator.pop(context);
                unawaited(Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FileAccess())));
              },
            ),
            ListTile(
              trailing: const Icon(Icons.gps_fixed),
              title: const Text('GpsData'),
              selected: name == 'GpsData',
              selectedColor: Theme.of(context).colorScheme.primary,
              onTap: () {
                unawaited(CurrentPage.setPage('GpsData'));
                Navigator.pop(context);
                unawaited(Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => GpsData())));
              },
            ),
            ListTile(
              title: const Text('RetrieveData'),
              selected: name == 'RetrieveData',
              selectedColor: Theme.of(context).colorScheme.primary,
              onTap: () {
                unawaited(CurrentPage.setPage('RetrieveData'));
                Navigator.pop(context);
                unawaited(Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RetrieveData())));
              },
            ),
          ],
        ),
      )
    );
  }
}
