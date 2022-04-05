import 'package:flutter/material.dart';
import 'package:gocart/augmented_faces.dart';
import 'package:gocart/cameraScreen.dart';
import 'package:gocart/custom_object.dart';
import 'package:gocart/utils.dart';

class tryMe extends StatefulWidget {
  tryMe({Key? key}) : super(key: key);

  @override
  State<tryMe> createState() => _tryMeState();
}

class _tryMeState extends State<tryMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const topBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Splash screen'),
            const Text('Delay'),
            const Text('Onboarding Screen'),
            const Text('Navigate to Login page'),
            logo(),
            gocartTextField(hint: "hint", control: TextEditingController()),
            ElevatedButton(
              onPressed: () {
                dialogs.showDeleteConfirmationDialog(context);
              },
              child: const Text('Try Dialog'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CameraApp()),
                );
              },
              child: const Text('Try AR CAMERA'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AugmentedFacesScreen()));
              },
              child: const Text("Augmented Faces"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CustomObject()));
              },
              child: const Text("Custom Anchored Object with onTap"),
            ),
            // ListTile(
            // onTap: () {
            //   Navigator.of(context).push(
            //       MaterialPageRoute(builder: (context) => AssetsObject()));
            // },
            // title: Text("Custom sfb object"),
            // ),
          ],
        ),
      ),
      bottomNavigationBar: const bottomBar(),
    );
  }
}
