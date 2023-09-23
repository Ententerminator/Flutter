import 'package:example_flutter_app/accelerometer.dart';
import 'package:example_flutter_app/camera.dart';
import 'package:example_flutter_app/contacts.dart';
import 'package:example_flutter_app/current_page.dart';
import 'package:example_flutter_app/file_access.dart';
import 'package:example_flutter_app/gps_data.dart';
import 'package:example_flutter_app/retrieve_data.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SavedPage(),
    );
  }
}

class SavedPage extends StatefulWidget {
  @override
  State<SavedPage> createState() => SavedPageState();
}

class SavedPageState extends State<SavedPage> {
  @override
  void initState() {
    super.initState();
    lastPage();
  }

  String page = 'cool';

  void lastPage() async {
    page = await CurrentPage.getPage();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    switch (page) {
      case 'Accelerometer':
        return Accelerometer();
      case 'Camera':
        return Camera();
      case 'Contacts':
        return Contacts();
      case 'FileAccess':
        return FileAccess();
      case 'GpsData':
        return GpsData();
      case 'RetrieveData':
        return RetrieveData();
      default:
        return MyHomePage();
    }
  }
}
