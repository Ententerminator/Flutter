import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

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
    // To display the current output from the Camera,
    // create a CameraController.
    unawaited(getCamera());
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    unawaited(_controller.dispose());
    super.dispose();
  }

  Future<void> getCamera() async {
    // Obtain a list of the available cameras on the device.
    final cameras = await availableCameras();

    // Get a specific camera from the list of available cameras.
    final firstCamera = cameras.first;

    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      firstCamera,
      // Define the resolution to use.
      ResolutionPreset.veryHigh,
    );

    // Next, initialize the controller. This returns a Future.
    await _controller.initialize();
    cameraAvailable = true;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return cameraAvailable
        ? Scaffold(
          appBar: MyAppbar(),
          body: CameraPreview(_controller),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final XFile xImage = await _controller.takePicture();
              if (!mounted) {
                return;
              }
              final result = await ImageGallerySaver.saveImage(await xImage.readAsBytes());
            // If the picture was taken, display it on a new screen.
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(
                  // Pass the automatically generated path to
                  // the DisplayPictureScreen widget.
                  imagePath: xImage.path,
                ),
              ),
            );
            },
            child: const Icon(Icons.camera_alt),
          ),
          endDrawer: MyDrawer(),
        )
        : Scaffold(
          appBar: MyAppbar(),
          body: Center(child: CircularProgressIndicator()),
          endDrawer: MyDrawer(),
        );
  }
}

class DisplayPictureScreen extends StatelessWidget{
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('This is the Picture')),
      body: Image.file(File(imagePath)),
    );
  }
}

