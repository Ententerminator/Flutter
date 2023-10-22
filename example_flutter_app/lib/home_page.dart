import 'package:example_flutter_app/current_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'accelerometer.dart';
import 'camera.dart';
import 'contacts.dart';
import 'drawer.dart';
import 'file_access.dart';
import 'gps_data.dart';
import 'retrieve_data.dart';

class HomepageButton extends StatelessWidget{
  String text;
  Widget page;
  HomepageButton( this.text, this.page);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        this.text,
        style: TextStyle(fontSize: 18),),
      onPressed: () {
        HapticFeedback.vibrate();
        CurrentPage.setPage(this.text);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => this.page));
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(160, 90),
      )
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Homepage'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox( height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            
            children: <Widget>[
              HomepageButton('Accelerometer', Accelerometer()),
              HomepageButton('Camera', Camera()),              
            ],
          ),
          SizedBox( height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              HomepageButton('Contacts', Contacts()),
              HomepageButton('FileAccess', FileAccess()),
            ],
          ),
          SizedBox( height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              HomepageButton('GpsData', GpsData()),
              HomepageButton('RetrieveData', RetrieveData()),
            ],
          ),
        ],
      ),
      endDrawer: MyDrawer(this.runtimeType.toString()),
    );
  }
}
