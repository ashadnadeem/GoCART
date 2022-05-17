import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gocart/Main%20Screen%20Pages/main_page.dart';
import 'package:gocart/Models/brand_model.dart';
import 'package:gocart/Controllers/brand_provider.dart';
import 'package:gocart/Controllers/cart_provider.dart';
import 'package:gocart/Controllers/debitcard_provider.dart';
import 'package:gocart/Controllers/item_provider.dart';
import 'package:gocart/Models/order_history_provider.dart';
import 'package:gocart/Controllers/search_provider.dart';
import 'package:gocart/Controllers/wishlist_provider.dart';
import 'package:gocart/Services/auth.dart';
import 'package:gocart/tryFile.dart';
import 'package:gocart/utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'Controllers/user_auth_provider.dart';
import 'Entities/user_auth_entity.dart';
import 'Controllers/address_provider.dart';
import 'Controllers/user_provider.dart';
import 'OnBoarding Pages/login_page.dart';
import 'OnBoarding Pages/signup_page.dart';

late List<CameraDescription> cameras;
Future<void> main() async {
  // For Flutter firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  print('ARCORE IS AVAILABLE?');
  // print(await ArCoreController.checkArCoreAvailability());
  print('\nAR SERVICES INSTALLED?');
  // print(await ArCoreController.checkIsArCoreInstalled());
  cameras = await availableCameras();
  runApp(
    MultiProvider(
      providers: [
        // Providers Sorted Alphabetically
        ChangeNotifierProvider(create: (_) => AddressProvider()),
        ChangeNotifierProvider(create: (_) => BrandProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => CardProvider()),
        ChangeNotifierProvider(create: (_) => ItemProvider()),
        ChangeNotifierProvider(create: (_) => OrderHistoryProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => WishListProvider()),
        ChangeNotifierProvider(create: (_) => SearchProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserAuth?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        title: 'GoCart',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: const MyHomePage(title: 'GoCart'),
        debugShowCheckedModeBanner: false,
      ),
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
  AuthService _auth = AuthService();
  @override
  void initState() {
    super.initState();
    // Load dummy data
    Future.delayed(const Duration(seconds: 6), () {
      setState(() {
        _isLoading = false;
      });
    });
    Future.delayed(Duration.zero, () async {
      addItemData(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Load User Data
    final userAuth = Provider.of<UserAuth?>(context);
    Future.delayed(Duration.zero, () async {
      context.read<UserProvider>().loadUser(userAuth);
    });

    return Scaffold(
      backgroundColor: Colors.yellow,
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (_isLoading) {
              // If its loading show loading splash screen
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: showSplashScreen,
              ));
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              // If its waiting to load progress Indicator
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              // If user is logged in (Non-null user) show main page
              return const MainPage();
            }
            // Else show OnBoarding Page
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: showOnboardingScreen(context),
            );
          }),
      floatingActionButton: userAuth == null
          ? FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => tryMe()),
                );
              },
              tooltip: 'Try',
              child: const Text('Try Me Page'),
            )
          : null,
    );
  }

  List<Widget> showOnboardingScreen(BuildContext context) {
    final user = Provider.of<UserAuth?>(context);
    return <Widget>[
      Hero(tag: 'logo', child: logo()),
      Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Container(
          height: 250,
          width: 350,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("icon/onboarding.gif"), fit: BoxFit.cover)),
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
      coolButton(
          text: "Get Started",
          functionToComply: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignupPage())
                // MaterialPageRoute(builder: (context) => const MainPage()),
                );
          }),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Text("Already have an account? "),
          InkWell(
            child: const Text("Login",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
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

  // This method is only for testing purposes
  void addItemData(BuildContext context) async {
    // Item Adding
    await context.read<ItemProvider>().loadProducts();
    // Make a copy for search
    context.read<SearchProvider>().makeCopy(context.read<ItemProvider>().list);
    // Brand Adding
    context.read<BrandProvider>().addItem(
          Brand(
              id: "010",
              name: "Nike",
              address: "Karachi, Pakistan",
              website: 'https://www.nike.com/',
              image:
                  "https://cdn.britannica.com/50/213250-050-02322AA8/Nike-logo.jpg"),
        );
    context.read<BrandProvider>().addItem(
          Brand(
              id: "011",
              name: "Ray.Ban",
              address: "Karachi, Pakistan",
              website: 'https://www.ray-ban.com/',
              hasAR: true,
              image:
                  "https://media.designrush.com/inspirations/129359/conversions/_1513769873_94_Ray-Ban-preview.jpg",
              ar_link: "assets/glasses_round_gold.png"),
        );
    context.read<BrandProvider>().addItem(
          Brand(
              id: "012",
              name: "Outfitters",
              address: "Karachi, Pakistan",
              website: 'https://outfitters.com.pk/',
              image:
                  "https://cdn.shopify.com/s/files/1/2290/7887/files/1200X628_aa0ccfa6-5e3d-4788-ae21-c97f6d74ba2e.jpg?v=1597126538"),
        );
    context.read<BrandProvider>().addItem(
          Brand(
              id: "013",
              name: "Khaadi",
              address: "Karachi, Pakistan",
              website: 'https://www.khaadi.com/',
              hasAR: true,
              image:
                  "https://fashiontimesmagazine.com/wp-content/uploads/2021/10/ff0fb676-bc35-4126-ab5f-ab85abd6dc1b.jpeg"),
        );
    context.read<BrandProvider>().addItem(
          Brand(
              id: "404",
              name: "Un-Branded",
              address: "Karachi, Pakistan",
              website: 'https://www.elo.com/',
              hasAR: false,
              image:
                  "https://mark.trademarkia.com/services/logo.ashx?sid=86298674"),
        );
    context.read<BrandProvider>().addItem(
          Brand(
              id: "014",
              name: "Hermes",
              address: "Karachi, Pakistan",
              website: 'https://www.hermes.com/',
              hasAR: false,
              image:
                  "https://logowik.com/content/uploads/images/489_hermesparis.jpg"),
        );
  }
}
