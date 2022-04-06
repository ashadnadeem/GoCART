import 'dart:typed_data';
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
  bool isLoading = true;
  List<String> filters = [
    'assets/Daco.png',
    'assets/joker.png',
    'assets/lipstick.png',
    'assets/makeup.png',
    'assets/fox_face_mesh_texture.png',
    'assets/glasses.png',
    'assets/rayban_classic_transparent.png',
    'assets/rayban_exotic_blue.png',
    // 'assets/face_mesh.png',
  ];
  int filterIndex = 0;

  void updateFilter() {
    filterIndex = ((filterIndex + 1) % filters.length);
    loadMesh();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: topBar(
          implyLeading: true,
        ),
        body: Stack(children: [
          ArCoreFaceView(
            onArCoreViewCreated: _onArCoreViewCreated,
            enableAugmentedFaces: true,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: updateFilter,
              child: const Text('Try Next Filter'),
            ),
          ),
        ]),
      ),
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
