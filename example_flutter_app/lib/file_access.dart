import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart'; 
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import 'appbar.dart';
import 'drawer.dart';

class FileAccess extends StatefulWidget {
  @override
  State<FileAccess> createState() => _FileAccessState();
}

class _FileAccessState extends State<FileAccess> {
  final _controller = TextEditingController();
  String fileName = '';

    Future<void> _saveFile() async {
    final String? downloadsDir = (await getDownloadsDirectory())?.path;

    fileName = _controller.text;
    final fileDownload = File('$downloadsDir/$fileName.txt');

    await fileDownload.writeAsString('hey ho was geht yo');
  }

  void _pickFile() async { 
      
    // opens storage to pick files and the picked file or files 
    // are assigned into result and if no file is chosen result is null. 
    // you can also toggle "allowMultiple" true or false depending on your need 
    final result = await FilePicker.platform.pickFiles(allowMultiple: true); 
    print(result);

    // if no file is picked 
    if (result == null) return; 
  
    // we get the file from result object 
    final file = result.files.first; 
    print(file.path);

    _openFile(file); 
  } 

  void _openFile(PlatformFile file) { 
    OpenFile.open(file.path); 
  } 

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar('FileAccess'),
      body: Center(
        child: Column(
          children: [
            SizedBox( height: 20),
            SizedBox(
              width: 250,
              height: 60,
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Filename',
                ),
                style: TextStyle(
                  fontSize: 18
                ),
              )
            ),
            SizedBox( height: 20),
            ElevatedButton( 
              onPressed: () async { 
                await _saveFile(); 
              }, 
              style: ElevatedButton.styleFrom(
                minimumSize: Size(250, 60),
              ),
              child: Text(
                  'Make File with Filename', 
                  style: TextStyle(fontSize: 18),
                ),
              ),
            SizedBox( height: 20),
            ElevatedButton( 
              onPressed: () { 
                _pickFile(); 
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(250, 60),
              ),
              child: Text( 
                'Pick and open file', 
                style: TextStyle(fontSize: 18),
              ),
            ),
          ]
        )
      ),
      endDrawer: MyDrawer('FileAccess'),
    );
  }
}
