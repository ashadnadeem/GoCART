import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Logo
class logo extends StatelessWidget {
  // logo({Key? key}) : super(key: key);
  logo(
      {this.primaryColor = Colors.black87,
      this.secondaryColor = Colors.redAccent,
      Key? key})
      : super(key: key);
  final Color primaryColor; //= const Color.fromARGB(255, 59, 59, 61);
  final Color secondaryColor; //= const Color.fromARGB(255, 232, 72, 85);
  final double _fontSize = 60;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'GO',
          style: GoogleFonts.poppins(
            fontSize: _fontSize,
            fontWeight: FontWeight.w300,
            color: primaryColor,
          ),
        ),
        Text(
          'C',
          style: GoogleFonts.poppins(
            fontSize: _fontSize,
            fontWeight: FontWeight.w900,
            color: primaryColor,
          ),
        ),
        Text(
          'AR',
          style: GoogleFonts.poppins(
            fontSize: _fontSize,
            fontWeight: FontWeight.w900,
            color: secondaryColor,
          ),
        ),
        Text(
          'T',
          style: GoogleFonts.poppins(
            fontSize: _fontSize,
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
    return Container(
      decoration: const BoxDecoration(
        color: const Color.fromARGB(255, 59, 59, 61),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.account_circle_outlined, size: 40, color: Colors.white),
            logo(
              primaryColor: Colors.white,
              secondaryColor: Colors.yellow,
            ),
            Icon(Icons.shopping_cart_outlined, size: 40, color: Colors.white),
            // Icon(Icons.card_travel_outlined, size: 40, color: Colors.white),
          ],
        ),
      ),
    );
  }
}

// Bottom App Bar
class bottomBar extends StatelessWidget implements PreferredSizeWidget {
  const bottomBar({Key? key}) : super(key: key);
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(70);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: const Color.fromARGB(255, 59, 59, 61),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const <Widget>[
            Icon(Icons.home_outlined, size: 40, color: Colors.white),
            Icon(Icons.search_outlined, size: 40, color: Colors.white),
            Icon(Icons.favorite_border_outlined, size: 40, color: Colors.white),
            Icon(Icons.shopping_cart_outlined, size: 40, color: Colors.white),
          ],
        ),
      ),
    );
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
  const coolButton({
    required this.text,
    required this.width,
    required this.height,
    required this.functionToComply,
    Key? key,
  }) : super(key: key);
  final double width, height;
  final String text;
  final void Function() functionToComply;
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
          primary: Colors.redAccent,
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(38),
          ),
          fixedSize: Size(width, height),
          shadowColor: Colors.grey.shade900,
        ),
        child: Text(text,
            style:
                GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.w600)),
        onPressed: functionToComply,
      ),
    );
  }
}

// GocartTextField
class gocartTextField extends StatelessWidget {
  const gocartTextField({
    required this.hint,
    required this.control,
    this.pswd = false,
    this.textType = TextInputType.text,
    Key? key,
  }) : super(key: key);
  final String hint;
  final TextEditingController control;
  final bool pswd;
  final TextInputType textType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: pswd,
      keyboardType: textType,
      controller: control,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade300,
        hintText: hint,
        hintStyle: GoogleFonts.poppins(
          color: Colors.grey,
          fontSize: 20,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(width: 2.0),
        ),
      ),
      style: GoogleFonts.poppins(
        color: Colors.black,
        fontSize: 20,
      ),
    );
  }
}
