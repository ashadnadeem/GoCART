import 'package:flutter/material.dart';
import 'package:gocart/accountpage.dart';
import 'package:gocart/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

// Logo
class logo extends StatelessWidget {
  // logo({Key? key}) : super(key: key);
  logo(
      {this.primaryColor = Colors.black87,
      this.secondaryColor = Colors.redAccent,
      this.fontSize = 60,
      Key? key})
      : super(key: key);
  final Color primaryColor; //= const Color.fromARGB(255, 59, 59, 61);
  final Color secondaryColor; //= const Color.fromARGB(255, 232, 72, 85);
  double fontSize;

  @override
  Widget build(BuildContext context) {
    fontSize = MediaQuery.of(context).size.width * 0.13;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'GO',
          style: GoogleFonts.poppins(
            fontSize: fontSize,
            fontWeight: FontWeight.w300,
            color: primaryColor,
          ),
        ),
        Text(
          'C',
          style: GoogleFonts.poppins(
            fontSize: fontSize,
            fontWeight: FontWeight.w900,
            color: primaryColor,
          ),
        ),
        Text(
          'AR',
          style: GoogleFonts.poppins(
            fontSize: fontSize,
            fontWeight: FontWeight.w900,
            color: secondaryColor,
          ),
        ),
        Text(
          'T',
          style: GoogleFonts.poppins(
            fontSize: fontSize,
            fontWeight: FontWeight.w900,
            color: primaryColor,
          ),
        ),
      ],
    );
  }
}

// App Bar
class topBar extends StatelessWidget implements PreferredSizeWidget {
  const topBar({Key? key}) : super(key: key);
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(90);
  @override
  Widget build(BuildContext context) {
    double screenSizeW = MediaQuery.of(context).size.width;
    double screenSizeH = MediaQuery.of(context).size.height;
    return Container(
      height: screenSizeH * 0.1,
      width: screenSizeW,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 59, 59, 61),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: screenSizeW * 0.15,
            height: screenSizeW * 0.15,
            child: IconButton(
              icon: Icon(Icons.account_circle_outlined,
                  size: screenSizeW * 0.12, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => myAccount()),
                );
              },
            ),
          ),
          SizedBox(width: screenSizeW * 0.03),
          logo(
            primaryColor: Colors.white,
            secondaryColor: Colors.yellow,
            fontSize: screenSizeW * 0.1,
          ),
          SizedBox(width: screenSizeW * 0.03),
          SizedBox(
            width: screenSizeW * 0.15,
            height: screenSizeW * 0.15,
            child: IconButton(
              icon: Icon(Icons.shopping_cart_outlined,
                  size: screenSizeW * 0.12, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => myAccount()),
                );
              },
            ),
          ),
          // Icon(Icons.card_travel_outlined, size: 40, color: Colors.white),
        ],
      ),
    );
  }
}

// Bottom App Bar
class bottomBar extends StatelessWidget implements PreferredSizeWidget {
  const bottomBar({Key? key}) : super(key: key);
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(80);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: const Color.fromARGB(255, 59, 59, 61),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.home_outlined,
                size: 50,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => homePage()));
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.search_outlined,
                size: 50,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => homePage()));
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.favorite_border_outlined,
                size: 50,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => homePage()));
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.shopping_cart_outlined,
                size: 50,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => homePage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Header with back button
class headerBar extends StatelessWidget {
  const headerBar({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    double screenSizeW = MediaQuery.of(context).size.width;
    double screenSizeH = MediaQuery.of(context).size.height;
    // returns a container with a back button and a title
    return Container(
        // height: screenSizeH * 0.05,
        width: screenSizeW,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: screenSizeW * 0.07,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: screenSizeW * 0.08,
                fontWeight: FontWeight.w900,
                color: const Color.fromARGB(255, 59, 59, 61),
              ),
            ),
            Container(width: screenSizeW * 0.1),
          ],
        ));
  }
}

// Dialog for confirm delete
class dialogs {
  static Future showDeleteConfirmationDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 232, 72, 85),
          title: const Text("Are you sure you want to delete this?",
              style: TextStyle(color: Colors.white)),
          // content: const Text('Please confirm that you want to delete this!'),
          actions: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black87,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child:
                        const Text('No', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                  TextButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white70,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Yes',
                        style: TextStyle(color: Colors.black87)),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ])
          ],
        );
      },
    );
  }
}

// Elevted Button Template
class coolButton extends StatelessWidget {
  coolButton({
    required this.text,
    required this.width,
    required this.height,
    required this.functionToComply,
    this.iconData,
    this.iconSize,
    this.textSize = 28,
    this.primaryColor = Colors.redAccent,
    Key? key,
  }) : super(key: key);
  final double width, height;
  final String text;
  final void Function() functionToComply;
  final IconData? iconData;
  final double? iconSize;
  double textSize;
  final Color primaryColor;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(38),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: primaryColor,
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(38),
          ),
          fixedSize: Size(width, height),
          shadowColor: Colors.grey.shade900,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconData != null) Icon(iconData, size: iconSize),
            Text(text,
                style: GoogleFonts.poppins(
                    fontSize: textSize, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center),
          ],
        ),
        onPressed: functionToComply,
      ),
    );
  }
}

// GocartTextField
class gocartTextField extends StatelessWidget {
  gocartTextField({
    required this.hint,
    required this.control,
    this.pswd = false,
    this.textType = TextInputType.text,
    this.editable = true,
    Key? key,
  }) : super(key: key);
  final String hint;
  final TextEditingController control;
  final bool pswd;
  final TextInputType textType;
  final bool? editable;
  @override
  Widget build(BuildContext context) {
    final double screenSizeW = MediaQuery.of(context).size.width;
    return TextField(
      enabled: editable,
      obscureText: pswd,
      keyboardType: textType,
      controller: control,
      decoration: InputDecoration(
        // set size of input field
        contentPadding: EdgeInsets.symmetric(
            horizontal: screenSizeW * 0.02, vertical: screenSizeW * 0.02),
        filled: true,
        fillColor: Colors.grey.shade300,
        hintText: hint,
        hintStyle: GoogleFonts.poppins(
          color: Colors.grey,
          fontSize: screenSizeW * 0.05,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(width: 2.0),
        ),
      ),
      style: GoogleFonts.poppins(
        color: Colors.black,
        fontSize: screenSizeW * 0.04,
      ),
    );
  }
}

class addressTile extends StatelessWidget {
  addressTile({Key? key, this.defaultAddress = false, required this.address})
      : super(key: key);
  bool defaultAddress;
  final Address address;
  @override
  Widget build(BuildContext context) {
    final double screenSizeW = MediaQuery.of(context).size.width;
    final double screenSizeH = MediaQuery.of(context).size.height;

    Widget editButton() {
      return IconButton(
        icon: Icon(Icons.edit_note_outlined, size: screenSizeW * 0.08),
        onPressed: () {},
      );
    }

    Widget deleteButton() {
      return IconButton(
        icon: Icon(Icons.delete_forever_outlined,
            color: Colors.red, size: screenSizeW * 0.07),
        onPressed: () {},
      );
    }

    return InkWell(
      onTap: () {
        // Change the default address
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Card(
          color: defaultAddress ? Colors.grey.shade300 : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 2,
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  Container(width: screenSizeW * 0.04),
                  Text(
                    '${address.name} ',
                    style: GoogleFonts.poppins(
                      fontSize: screenSizeW * 0.04,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  defaultAddress ? Container() : editButton(),
                  Expanded(
                    child: Container(
                      color: Colors.black54,
                      height: 2,
                    ),
                  ),
                  defaultAddress ? editButton() : deleteButton(),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(width: screenSizeW * 0.04),
                  Text(
                    'Address:  ',
                    style: GoogleFonts.poppins(
                      fontSize: screenSizeW * 0.04,
                      fontWeight: FontWeight.w300,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    address.address,
                    style: GoogleFonts.poppins(
                      fontSize: screenSizeW * 0.04,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(width: screenSizeW * 0.04),
                  Text(
                    'City:          ',
                    style: GoogleFonts.poppins(
                      fontSize: screenSizeW * 0.04,
                      fontWeight: FontWeight.w300,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    address.city,
                    style: GoogleFonts.poppins(
                      fontSize: screenSizeW * 0.04,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(width: screenSizeW * 0.04),
                  Text(
                    'Phone:     ',
                    style: GoogleFonts.poppins(
                      fontSize: screenSizeW * 0.04,
                      fontWeight: FontWeight.w300,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    address.phone,
                    style: GoogleFonts.poppins(
                      fontSize: screenSizeW * 0.04,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenSizeH * 0.01),
            ],
          ),
        ),
      ),
    );
  }
}

class Address {
  Address({
    required this.name,
    required this.address,
    required this.city,
    required this.phone,
  });
  final String name, address, city, phone;
}
