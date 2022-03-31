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
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   titleSpacing: 0.0,
      //   title: topBar(),
      // ),
      appBar: const topBar(),
      body: Center(
        child: Column(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: screenWidth * 0.04),
              Text('Recomended Brands  ',
                  style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.w500)),
              Expanded(
                child: Container(
                  height: 2,
                  color: Colors.grey,
                ),
              ),
              Container(width: screenWidth * 0.04),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: screenWidth * 0.04),
              Text('Trending  ',
                  style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.w500)),
              Expanded(
                child: Container(
                  height: 2,
                  color: Colors.grey,
                ),
              ),
              Container(width: screenWidth * 0.04),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: screenWidth * 0.04),
              Text('AR Compatible  ',
                  style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.w500)),
              Expanded(
                child: Container(
                  height: 2,
                  color: Colors.grey,
                ),
              ),
              Container(width: screenWidth * 0.04),
            ],
          ),
        ]),
      ),
      bottomNavigationBar: const bottomBar(),
    );
  }
}
