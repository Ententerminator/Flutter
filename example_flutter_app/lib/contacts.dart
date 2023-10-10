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
      appBar: MyAppbar(),
      body: Center(
        child: Column( 
          children:[
            ElevatedButton( 
              onPressed: _pickContact, //referenz wird weitergegeben, damit ers selber später callen kann
              child: Text( 
                'Pick Contacts', 
              )
            ),
            ElevatedButton( 
              onPressed: contact != null ? _viewContact : null, 
              child: Text( 
                'View Contact ${contact?.name.first??''} ${contact?.name.last??''}',
              )
            ),
            ElevatedButton( 
              onPressed: _insertContact, 
              child: Text( 
                'Make new Friend',
              )
            ),
            ElevatedButton( 
              onPressed: contact != null ? _deleteContact : null, 
              child: Text( 
                'Delete Friend ${contact?.name.first??''} ${contact?.name.last??''}',
              )
            ),
          ]
        ),
      ),
      endDrawer: MyDrawer(),
    );
  }
}
