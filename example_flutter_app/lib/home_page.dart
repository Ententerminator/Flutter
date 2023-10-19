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

//entweder 3 rows 1 column
//oder buttons padding rundherum geben

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
        minimumSize: Size(150, 90),
        //padding: EdgeInsets.symmetric(vertical: 100)
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
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox( height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            
            children: <Widget>[
              HomepageButton('Accelerometer', Accelerometer()),
              HomepageButton('Camera', Camera()),
              //Padding(padding: EdgeInsets.fromLTRB(20, 120, 20, 0))
              
            ],
          ),
          SizedBox( height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              HomepageButton('Contacts', Contacts()),
              HomepageButton('FileAccess', FileAccess()),
              //Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0))
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
      endDrawer: MyDrawer(),
    );
  }
}
