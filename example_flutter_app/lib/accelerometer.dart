import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

import 'appbar.dart';
import 'drawer.dart';

class Accelerometer extends StatefulWidget {
  @override
  State<Accelerometer> createState() => _AccelerometerState();
}

class _AccelerometerState extends State<Accelerometer> {
  double x = 0, y = 0, z = 0;
  late StreamSubscription<UserAccelerometerEvent> subscription;

  @override
  void initState() {
    subscription = userAccelerometerEvents.listen(
      (UserAccelerometerEvent event) {
        print(event);
        x = event.x;
        y = event.y;
        z = event.z;

        setState(() {});
      },
      onError: (error) {
        // Logic to handle error
        // Needed for Android in case sensor is not available
      },
      cancelOnError: true,
    );
    // [AccelerometerEvent (x: 0.0, y: 9.8, z: 0.0)]
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar('Accelerometer'),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          //prettify: x is in eigene column, damits nicht flackert
          const Column(
            children: [
              SizedBox(height: 100),
              Text(' x Axis: '),  //wischen richtung
              SizedBox(height: 20),
              Text(' y Axis: '), //stabbing richtung
              SizedBox(height: 20),
              Text(' z Axis: ') //rauf runter
            ],
          ),
          Column(
            children: [
              SizedBox(height: 100),
              Text(x.toStringAsFixed(5)),
              SizedBox(height: 20),
              Text(y.toStringAsFixed(5)),
              SizedBox(height: 20),
              Text(z.toStringAsFixed(5))
            ],
          )
        ]),
      ),
      endDrawer: MyDrawer('Accelerometer'),
    );
  }
}
