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

  @override
  void initState() {
    userAccelerometerEvents.listen(
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(),
      body: Center(
        child: Column(children: [
          //prettify: x is in eigene column, damits nicht flackert
          Text(' x is ' + x.toString()),
          Text(' y is ' + y.toString()),
          Text(' z is ' + z.toString()),
        ]),
      ),
      endDrawer: MyDrawer(),
    );
  }
}
