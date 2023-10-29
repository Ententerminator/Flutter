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

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    this.timer = Timer.periodic(Duration(milliseconds: 2000), (timer) async {
      Position position = await _determinePosition();

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
      appBar: MyAppbar('GpsData'),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          const Column(
            children: [
              SizedBox(height: 100),
              Text('Latitude: '),
              SizedBox(height: 20),
              Text('Longitude: ')
              ],
          ),
          Column(
            children: [
              SizedBox(height: 100),
              Text(_latitude),
              SizedBox(height: 20),
              Text(_longitude)
              ],
          ),
        ]),
      ),
      endDrawer: MyDrawer('GpsData'),
    );
  }
}
