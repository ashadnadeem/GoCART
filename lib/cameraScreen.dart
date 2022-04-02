import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:gocart/main.dart';
import 'package:gocart/utils.dart';

class CameraApp extends StatefulWidget {
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController controller;
  bool cameraInitialized = false;

  @override
  void initState() {
    super.initState();
    // Delay to allow the camera to initialize
    setState(() {});
    Future.delayed(Duration(seconds: 1), () {
      cameraInitialized = true;
      setState(() {});
    });
    // Camera[1] for Selfie Cam
    // Camera[0] for Main-Back Cam
    controller = CameraController(cameras[1], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // if (cameras == null || !controller.value.isInitialized) {
    //   return Container(
    //     child: const JumpingLogo(),
    //   );
    // }
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.yellow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo(),
              const headerBar(title: "Live Camera"),
              cameraInitialized
                  ? Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: AspectRatio(
                          aspectRatio: controller.value.aspectRatio,
                          child: CameraPreview(controller)),
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.3),
                      child: JumpingLogo(),
                    ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const bottomBar(),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<CameraController>('controller', controller));
  }
}
