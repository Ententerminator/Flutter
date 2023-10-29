import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

import 'appbar.dart';
import 'drawer.dart';

class Contacts extends StatefulWidget {
  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  Contact? contact;

  @override
    void initState() {
      super.initState();
      unawaited(FlutterContacts.requestPermission()); //ask for consent
    }

  Future<void> _pickContact() async {
    contact = await FlutterContacts.openExternalPick();
    setState(() {});
  }

  Future _viewContact() async {
    await FlutterContacts.openExternalView(contact!.id); //Rufzeichen sagt "ich bin mir SICHER, dass es nicht null sein kann"
  }

  Future _insertContact() async {
    await FlutterContacts.openExternalInsert();
  }

  Future _deleteContact() async {
    await contact!.delete();
    contact = null;
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar('Contacts'),
      body: Center(
        child: Column( 
          children:[
            SizedBox( height: 20),
            ElevatedButton( 
              onPressed: _pickContact, //referenz wird weitergegeben, damit ers selber später callen kann
              child: Text('Pick Contact')
            ),
            SizedBox( height: 20),
            ElevatedButton( 
              style: ElevatedButton.styleFrom(alignment: Alignment.center),
              onPressed: contact != null ? _viewContact : null, 
              child: Text( 
                'View Contact \n${contact?.name.first??''} ${contact?.name.last??''}',
              )
            ),
            SizedBox( height: 20),
            ElevatedButton( 
              onPressed: _insertContact, 
              child: Text('New Contact')
            ),
            SizedBox( height: 20),
            ElevatedButton.icon( 
              icon: Icon(Icons.delete),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 245, 65, 52)
              ),
              onPressed: contact != null ? _deleteContact : null, 
              label: Text( 
                'Delete Contact ${contact?.name.first??''} ${contact?.name.last??''}',
              )
            ),
          ]
        ),
      ),
      endDrawer: MyDrawer('Contacts'),
    );
  }
}
