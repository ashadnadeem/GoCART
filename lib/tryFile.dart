import 'package:flutter/material.dart';
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
      appBar: AppBar(
        title: const Text('Try Me Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Splash screen'),
            const Text('Delay'),
            const Text('Onboarding Screen'),
            const Text('Navigate to Login page'),
            logo(),
            topBar(implyLeading: false),
            bottomBar(),
            gocartTextField(hint: "hint", control: TextEditingController()),
            ElevatedButton(
                onPressed: () {
                  dialogs.showDeleteConfirmationDialog(context);
                },
                child: const Text('Try Dialog')),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
