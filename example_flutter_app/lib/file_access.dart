import 'dart:async';
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

    await fileDownload.writeAsString('Why dont programmers wear glasses?');
  }

  void _pickFile() async { 
    final result = await FilePicker.platform.pickFiles(allowMultiple: true); 

    if (result == null) {
      return;
    } 
  
    final file = result.files.first; 
    _openFile(file); 
  } 

  void _openFile(PlatformFile file) { 
    unawaited(OpenFile.open(file.path)); 
  } 

  @override
  void dispose() {
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
                style: TextStyle(fontSize: 18),
              )
            ),
            SizedBox( height: 20),
            ElevatedButton( 
              onPressed: () async { 
                await _saveFile(); 
              }, 
              style: ElevatedButton.styleFrom(minimumSize: Size(250, 60)),
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
              style: ElevatedButton.styleFrom(minimumSize: Size(250, 60)),
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
