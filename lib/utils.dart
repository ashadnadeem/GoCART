import 'package:flutter/material.dart';

// Logo
class logo extends StatelessWidget {
  // logo({Key? key}) : super(key: key);
  logo(
      {this.primaryColor = Colors.black,
      this.secondaryColor = Colors.redAccent,
      Key? key})
      : super(key: key);
  final Color primaryColor; //= const Color.fromARGB(255, 59, 59, 61);
  final Color secondaryColor; //= const Color.fromARGB(255, 232, 72, 85);
  final String _fontFam = 'Poppins';
  final double _fontSize = 60;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'GO',
          style: TextStyle(
            fontSize: _fontSize,
            fontWeight: FontWeight.w100,
            color: primaryColor,
            fontFamily: _fontFam,
          ),
        ),
        Text(
          'C',
          style: TextStyle(
            fontSize: _fontSize,
            fontWeight: FontWeight.w900,
            color: primaryColor,
            fontFamily: _fontFam,
          ),
        ),
        Text(
          'AR',
          style: TextStyle(
            fontSize: _fontSize,
            fontWeight: FontWeight.w900,
            color: secondaryColor,
            fontFamily: _fontFam,
          ),
        ),
        Text(
          'T',
          style: TextStyle(
            fontSize: _fontSize,
            fontWeight: FontWeight.w900,
            color: primaryColor,
            fontFamily: _fontFam,
          ),
        ),
      ],
    );
  }
}

// App Bar
class topBar extends StatelessWidget {
  const topBar({Key? key}) : super(key: key);
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
class bottomBar extends StatelessWidget {
  const bottomBar({Key? key}) : super(key: key);
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    required this.functionToComply,
    Key? key,
  }) : super(key: key);
  final String text;
  final void Function() functionToComply;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.redAccent,
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
      onPressed: functionToComply,
    );
  }
}
