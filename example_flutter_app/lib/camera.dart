import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'appbar.dart';
import 'drawer.dart';

class Camera extends StatefulWidget {
  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  late CameraController _controller;
  bool cameraAvailable = false;
  String path = "null";

  @override
  void initState() {
    super.initState();
    unawaited(getCamera());
  }

  @override
  void dispose() {
    unawaited(_controller.dispose());
    super.dispose();
  }

  Future<void> getCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _controller = CameraController(
      firstCamera,
      ResolutionPreset.veryHigh,
    );

    await _controller.initialize();
    cameraAvailable = true;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return cameraAvailable
      ? Scaffold(
        appBar: MyAppbar('Camera'),
        body: Column(  
          children: [
            Container(
              height: 30, 
              width: double.infinity,
              color: Theme.of(context).colorScheme.primary,
              alignment: Alignment.center,
              child: Text(
                'Take a Picture! :)', 
                style: TextStyle(color: Colors.white),
                )
              ),
            CameraPreview(_controller),
          ]
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final XFile xImage = await _controller.takePicture();
            if (!mounted) {
              return;
            }
            await ImageGallerySaver.saveImage(await xImage.readAsBytes());
            await Navigator.of(context).push( 
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(
                  imagePath: xImage.path,
                ),
              ),
            );
          },
          child: const Icon(Icons.camera_alt),
        ),
        endDrawer: MyDrawer('Camera'),
      )
      : Scaffold(
        appBar: MyAppbar('Camera'),
        body: Center(child: CircularProgressIndicator()),
        endDrawer: MyDrawer('Camera'),
      );
  }
}

class DisplayPictureScreen extends StatelessWidget{
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('This is the Picture')
      ),
      body: Image.file(File(imagePath)),
    );
  }
}

