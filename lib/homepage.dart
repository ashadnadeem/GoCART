import 'package:flutter/material.dart';
import 'package:gocart/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class homePage extends StatefulWidget {
  homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   titleSpacing: 0.0,
      //   title: topBar(),
      // ),
      appBar: topBar(),
      body: Center(
        child: Column(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 15),
              Text('Recomended Brands',
                  style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.w500)),
              Container(
                width: MediaQuery.of(context).size.width - 226,
                height: 2,
                color: Colors.grey,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 15),
              Text('Trending',
                  style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.w500)),
              Container(
                width: MediaQuery.of(context).size.width - 105,
                height: 2,
                color: Colors.grey,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 15),
              Text('AR Compatible',
                  style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.w500)),
              Container(
                width: MediaQuery.of(context).size.width - 165,
                height: 2,
                color: Colors.grey,
              )
            ],
          ),
        ]),
      ),
      // bottomNavigationBar: BottomAppBar(),
      bottomNavigationBar: bottomBar(),
    );
  }
}
