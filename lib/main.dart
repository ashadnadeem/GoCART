import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gocart/Models/item_model.dart';
import 'package:gocart/Models/item_provider.dart';
import 'package:gocart/OnBoarding%20Pages/login_page.dart';
import 'package:gocart/OnBoarding%20Pages/signup_page.dart';
import 'package:gocart/tryFile.dart';
import 'package:gocart/utils.dart';
import 'package:provider/provider.dart';

late List<CameraDescription> cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print('ARCORE IS AVAILABLE?');
  // print(await ArCoreController.checkArCoreAvailability());
  print('\nAR SERVICES INSTALLED?');
  // print(await ArCoreController.checkIsArCoreInstalled());
  cameras = await availableCameras();
  runApp(ChangeNotifierProvider(
    create: (_) => ItemProvider(),
    child: const MyApp(),
  ));
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
    super.initState();
    Future.delayed(Duration(seconds: 6), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _isLoading ? showSplashScreen : showOnboardingScreen(context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => tryMe(),
              // builder: (context) => paymentMethods(),
              // builder: (context) => CameraApp(),
            ),
          );
        },
        tooltip: 'Try',
        child: const Text('Try Me Page'),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  List<Widget> showOnboardingScreen(BuildContext context) {
    return <Widget>[
      Hero(tag: 'logo', child: logo()),
      Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Container(
          height: 250,
          width: 350,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  // "https://somelink",
                  "https://cdn.dribbble.com/users/2681962/screenshots/8971020/media/b476167100a1e276339525c6e578cb70.gif",
                ),
                fit: BoxFit.cover),
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      Text(
        'Try what you like without leaving \nthe comfort of your home',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20, color: Colors.grey.shade800),
      ),
      const SizedBox(
        height: 50,
      ),
      Hero(
        tag: 'onBoarding Button',
        child: coolButton(
            text: "Get Started",
            functionToComply: () {
              addItemData(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignupPage()),
                // MaterialPageRoute(builder: (context) => const MainPage()),
              );
            }),
      ),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Text("Already have an account? "),
          InkWell(
            child: const Text("Login",
                style: TextStyle(
                  color: Colors.red,
                  decoration: TextDecoration.underline,
                )),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
          ),
        ],
      ),
    ];
  }

  List<Widget> get showSplashScreen {
    return <Widget>[
      // logo(),
      const JumpingLogo(),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 150),
        child: LinearProgressIndicator(color: Colors.redAccent),
      ),
    ];
  }

  void addItemData(BuildContext context) {
    context.read<ItemProvider>().addItem(
          Item(
              name: "Nike",
              description: "Contour 40",
              price: 12000,
              isFav: false,
              image:
                  "https://cdn.britannica.com/50/213250-050-02322AA8/Nike-logo.jpg"),
        );
    context.read<ItemProvider>().addItem(
          Item(
              name: "Ray.Ban",
              description: "Sunlit",
              price: 45000,
              isFav: true,
              image:
                  "https://media.designrush.com/inspirations/129359/conversions/_1513769873_94_Ray-Ban-preview.jpg"),
        );
    context.read<ItemProvider>().addItem(
          Item(
              name: "Outfitters",
              description: "T-Shirt",
              price: 4500,
              isFav: true,
              image:
                  "https://cdn.shopify.com/s/files/1/2290/7887/files/1200X628_aa0ccfa6-5e3d-4788-ae21-c97f6d74ba2e.jpg?v=1597126538"),
        );
    context.read<ItemProvider>().addItem(
          Item(
              name: "Outfitters",
              description: "T-Shirt 2",
              price: 45004,
              isFav: false,
              image:
                  "https://cdn.shopify.com/s/files/1/2290/7887/files/1200X628_aa0ccfa6-5e3d-4788-ae21-c97f6d74ba2e.jpg?v=1597126538"),
        );
  }
}
