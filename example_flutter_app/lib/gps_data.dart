import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'appbar.dart';
import 'drawer.dart';

class GpsData extends StatefulWidget {
  @override
  State<GpsData> createState() => _GpsDataState();
}

class _GpsDataState extends State<GpsData> {
  String _latitude = "";
  String _longitude = "";
  late Timer timer;

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    // here we could be adding a desired accuracy to the position
    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    this.timer = Timer.periodic(Duration(milliseconds: 2000), (timer) async {
      Position position = await _determinePosition();
      print(position);

      _latitude = position.latitude.toString();
      _longitude = position.longitude.toString();
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    this.timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(),
      body: Center(
        child: Column(children: [
          //prettify: long/lat in eigene column, damits nicht flackert
          Text('Latitude is ${_latitude}'),
          Text('Longitude is ${_longitude}'),
        ]),
      ),
      endDrawer: MyDrawer(),
    );
  }
}
