import 'package:example_flutter_app/current_page.dart';
import 'package:flutter/material.dart';
import 'accelerometer.dart';
import 'camera.dart';
import 'contacts.dart';
import 'drawer.dart';
import 'file_access.dart';
import 'gps_data.dart';
import 'retrieve_data.dart';

class MyHomePage extends StatelessWidget {
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
              child: const Text('Accelerometer'),
              onPressed: () {
                CurrentPage.setPage('Accelerometer');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Accelerometer()));
              },
            ),
            ElevatedButton(
              child: const Text('Camera'),
              onPressed: () {
                CurrentPage.setPage('Camera');
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Camera()));
              },
            ),
            ElevatedButton(
              child: const Text('Contacts'),
              onPressed: () {
                CurrentPage.setPage('Contacts');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Contacts()));
              },
            ),
            ElevatedButton(
              child: const Text('FileAccess'),
              onPressed: () {
                CurrentPage.setPage('FileAccess');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FileAccess()));
              },
            ),
            ElevatedButton(
              child: const Text('GpsData'),
              onPressed: () {
                CurrentPage.setPage('GpsData');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GpsData()));
              },
            ),
            ElevatedButton(
              child: const Text('RetrieveData'),
              onPressed: () {
                CurrentPage.setPage('RetrieveData');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RetrieveData()));
              },
            ),
          ],
        ),
      ),
      endDrawer: MyDrawer(),
    );
  }
}
