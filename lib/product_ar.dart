import 'package:gocart/utils.dart';
import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/services.dart';

class FaceProductAR extends StatefulWidget {
  const FaceProductAR({required this.link, Key? key}) : super(key: key);
  final String link;
  @override
  _FaceProductARState createState() => _FaceProductARState();
}

class _FaceProductARState extends State<FaceProductAR> {
  late ArCoreFaceController arCoreFaceController;
  bool isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Delay to allow the camera to initialize
    setState(() {});
    Future.delayed(const Duration(seconds: 2), () {
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
        body: isLoaded ? ArCam() : const Center(child: JumpingLogo()),
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
              onPressed: () {},
              child: const Text('Take A Picture'),
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
        await rootBundle.load(widget.link);

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
