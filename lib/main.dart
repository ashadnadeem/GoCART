import 'package:flutter/material.dart';
import 'package:gocart/tryFile.dart';
import 'package:gocart/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoCart',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'GoCart'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _isLoading
              // Show Splash Screen
              ? <Widget>[
                  logo(),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 100),
                    child: LinearProgressIndicator(),
                  ),
                ]
              // Show Onboarding Screen
              : <Widget>[
                  logo(),
                  // NetworkImage("https://www.bing.com/images/blob?bcid=TrmDGqHd4vkDqxcxoNWLuD9SqbotqVTdP7E"),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    child: Text(
                        'Try what you like without leaving \nthe comfort of your home'),
                  ),
                  coolButton(text: "Get Started", functionToComply: () {}),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Text("Already have an account? "),
                        InkWell(
                            child: const Text("Login",
                                style: TextStyle(color: Colors.red)),
                            onTap: () {})
                      ]),
                ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => tryMe(),
            ),
          );
        },
        tooltip: 'Try',
        child: const Text('Try Me Page'),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
