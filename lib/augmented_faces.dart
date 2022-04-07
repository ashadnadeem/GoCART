import 'dart:typed_data';
import 'package:gocart/main.dart';
import 'package:gocart/utils.dart';
import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/services.dart';

class AugmentedFacesScreen extends StatefulWidget {
  const AugmentedFacesScreen({Key? key}) : super(key: key);

  @override
  _AugmentedFacesScreenState createState() => _AugmentedFacesScreenState();
}

class _AugmentedFacesScreenState extends State<AugmentedFacesScreen> {
  late ArCoreFaceController arCoreFaceController;
  List<String> filters = [
    "assets/fox_face_mesh_texture.png",
    "assets/glasses_round_gold.png",
    "assets/glasses_round_golden.png",
    "assets/glasses.png",
    "assets/rayban_classic_transparent.png",
    "assets/rayban_exotic_blue.png",
    "assets/mask_camo_green.png",
    "assets/mask_geometric.png",
    "assets/mask_iba.png",
    // 'assets/face_mesh.png',
  ];
  int filterIndex = 8;
  bool isLoaded = false;
  void updateFilter() {
    filterIndex = ((filterIndex + 1) % filters.length);
    loadMesh();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Delay to allow the camera to initialize
    setState(() {});
    Future.delayed(Duration(seconds: 1), () {
      isLoaded = true;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.yellow,
        appBar: const MyAppBar(
          implyLeading: true,
        ),
        body: isLoaded ? ArCam() : Center(child: const JumpingLogo()),
      ),
    );
  }

  Widget ArCam() {
    return Stack(
      children: [
        ArCoreFaceView(
          onArCoreViewCreated: _onArCoreViewCreated,
          enableAugmentedFaces: true,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: updateFilter,
              child: const Text('Try Next Filter'),
            ),
          ),
        ),
      ],
    );
  }

  void _onArCoreViewCreated(ArCoreFaceController controller) {
    arCoreFaceController = controller;
    loadMesh();
  }

  loadMesh() async {
    ByteData textureBytes =
        // await rootBundle.load('assets/fox_face_mesh_texture.png');
        await rootBundle.load(filters[filterIndex]);

    arCoreFaceController.loadMesh(
        textureBytes: textureBytes.buffer.asUint8List(),
        skin3DModelFilename: 'filter.sfb');
  }

  @override
  void dispose() {
    arCoreFaceController.dispose();
    super.dispose();
  }
}
