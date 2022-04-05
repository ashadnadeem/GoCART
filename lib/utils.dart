import 'package:awesome_card/awesome_card.dart';
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
      this.fontSize = -1,
      Key? key})
      : super(key: key);
  final Color primaryColor; //= const Color.fromARGB(255, 59, 59, 61);
  final Color secondaryColor; //= const Color.fromARGB(255, 232, 72, 85);
  double fontSize;

  @override
  Widget build(BuildContext context) {
    if (fontSize == -1) {
      fontSize = MediaQuery.of(context).size.height * 0.08;
    }
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
    return SafeArea(
      bottom: false,
      child: Container(
        height: screenSizeH * 0.08,
        width: screenSizeW,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 59, 59, 61),
          // Border radius only for botom
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // Profile Icon
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: IconButton(
                  icon: Icon(Icons.account_circle_outlined,
                      size: screenSizeH * 0.05, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => myAccount()),
                    );
                  },
                ),
              ),
              // Logo
              logo(
                primaryColor: Colors.white,
                secondaryColor: Colors.yellow,
                fontSize: screenSizeH * 0.05,
              ),
              // Cart Icon
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: IconButton(
                  icon: Icon(Icons.shopping_cart_outlined,
                      size: screenSizeH * 0.05, color: Colors.white),
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
  Size get preferredSize => Size.fromHeight(80);
  @override
  Widget build(BuildContext context) {
    final double iconSize = MediaQuery.of(context).size.height * 0.05;
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 59, 59, 61),
        // Border radius only for botom
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home_outlined,
                size: iconSize,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => homePage()));
              },
            ),
            IconButton(
              icon: Icon(
                Icons.search_outlined,
                size: iconSize,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => homePage()));
              },
            ),
            IconButton(
              icon: Icon(
                Icons.favorite_border_outlined,
                size: iconSize,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => homePage()));
              },
            ),
            IconButton(
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: iconSize,
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
        width: screenSizeW,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: screenSizeH * 0.04,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: screenSizeH * 0.03,
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
    required this.functionToComply,
    this.primaryColor = Colors.redAccent,
    Key? key,
  }) : super(key: key);
  final String text;
  final void Function() functionToComply;
  final Color primaryColor;
  @override
  Widget build(BuildContext context) {
    final double textSize = MediaQuery.of(context).size.height * 0.03;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: primaryColor,
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(38),
        ),
        shadowColor: Colors.grey.shade900,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(text,
            style: GoogleFonts.poppins(
                fontSize: textSize, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center),
      ),
      onPressed: functionToComply,
    );
  }
}

// coolCardTemplate: a card with a icon and a title
class coolCard extends StatelessWidget {
  const coolCard({
    Key? key,
    required this.text,
    required this.functionToComply,
    this.iconData,
    this.primaryColor = Colors.redAccent,
  }) : super(key: key);
  final String text;
  final void Function() functionToComply;
  final IconData? iconData;
  final Color primaryColor;
  @override
  Widget build(BuildContext context) {
    final double screenSizeH = MediaQuery.of(context).size.height;
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
          shadowColor: Colors.grey.shade900,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: screenSizeH * 0.12,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(iconData, size: screenSizeH * 0.06),
                Text(text.split(" ")[0],
                    style: GoogleFonts.poppins(
                        fontSize: screenSizeH * 0.02,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center),
                Text(text.split(" ")[1],
                    style: GoogleFonts.poppins(
                        fontSize: screenSizeH * 0.02,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center),
              ],
            ),
          ),
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
    this.length,
    this.onChangedFunction,
    Key? key,
  }) : super(key: key);
  final String hint;
  final TextEditingController control;
  final bool pswd;
  final TextInputType textType;
  final bool? editable;
  final int? length;
  final void Function(String)? onChangedFunction;
  @override
  Widget build(BuildContext context) {
    final double screenSizeH = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(bottom: length == null ? 20 : 0),
      child: TextField(
        onChanged: onChangedFunction,
        maxLength: length,
        enabled: editable,
        obscureText: pswd,
        keyboardType: textType,
        controller: control,
        decoration: InputDecoration(
          // set size of input field
          contentPadding: EdgeInsets.symmetric(
              vertical: screenSizeH * 0.000, horizontal: 20),
          filled: true,
          fillColor: Colors.grey.shade300,
          hintText: hint,
          hintStyle: GoogleFonts.poppins(
            color: Colors.grey,
            fontSize: screenSizeH * 0.02,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(width: 2.0),
          ),
        ),
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: screenSizeH * 0.02,
        ),
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
    final double screenSizeH = MediaQuery.of(context).size.height;
    final double fontsize = screenSizeH * 0.015;
    Widget editButton() {
      return IconButton(
        icon: Icon(Icons.edit_note_outlined, size: screenSizeH * 0.03),
        onPressed: () {},
      );
    }

    Widget deleteButton() {
      return IconButton(
        icon: Icon(Icons.delete_forever_outlined,
            color: Colors.red, size: screenSizeH * 0.03),
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
                  Container(width: screenSizeH * 0.01),
                  Text(
                    '${address.name} ',
                    style: GoogleFonts.poppins(
                      fontSize: screenSizeH * 0.02,
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
                  Container(width: screenSizeH * 0.03),
                  Text(
                    'Address:  ',
                    style: GoogleFonts.poppins(
                      fontSize: fontsize,
                      fontWeight: FontWeight.w300,
                      color: Colors.black54,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      address.address,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: GoogleFonts.poppins(
                        fontSize: fontsize,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(width: screenSizeH * 0.03),
                  Text(
                    'City:          ',
                    style: GoogleFonts.poppins(
                      fontSize: fontsize,
                      fontWeight: FontWeight.w300,
                      color: Colors.black54,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      address.city,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: GoogleFonts.poppins(
                        fontSize: fontsize,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(width: screenSizeH * 0.03),
                  Text(
                    'Phone:     ',
                    style: GoogleFonts.poppins(
                      fontSize: fontsize,
                      fontWeight: FontWeight.w300,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    address.phone,
                    style: GoogleFonts.poppins(
                      fontSize: fontsize,
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

// DebitCard Container
class bankCard extends StatelessWidget {
  bankCard({required this.card, Key? key, this.options = true})
      : super(key: key);
  final DebitCard card;
  bool options;
  @override
  Widget build(BuildContext context) {
    final double screenSizeH = MediaQuery.of(context).size.height;
    Color cardColor;
    if (getCardType(card.cardNumber) == CardType.visa) {
      // Visa
      cardColor = Colors.red.shade900;
    } else if (getCardType(card.cardNumber) == CardType.masterCard) {
      // MasterCard
      cardColor = Colors.blueGrey;
    } else if (getCardType(card.cardNumber) == CardType.maestro) {
      // Union Pay
      cardColor = Colors.purple.shade900;
    } else {
      // Unknown
      cardColor = Colors.black;
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CreditCard(
            width: screenSizeH * 0.45,
            height: screenSizeH * 0.26,
            // frontBackground: CardBackgrounds.black,
            frontBackground: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              color: cardColor,
            ),
            backBackground: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              color: cardColor,
            ), //Color(0xffF9F9FA)
            cardType: getCardType(card.cardNumber),
            // cardType: CardType.discover,
            showShadow: true,
            bankName: card.bankName,
            showBackSide: !card.cardFront,
            cardNumber: card.cardNumber,
            cardExpiry: card.expiryDate,
            cardHolderName: card.cardHolderName,
            cvv: card.cvv,
          ),
        ),
        options
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit_note_outlined,
                        size: screenSizeH * 0.04),
                    onPressed: () {},
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: IconButton(
                      icon: Icon(Icons.delete_forever_outlined,
                          color: Colors.red, size: screenSizeH * 0.04),
                      onPressed: () {},
                    ),
                  ),
                ],
              )
            : Container(),
      ],
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

class DebitCard {
  DebitCard(
      {required this.cardNumber,
      required this.expiryDate,
      required this.cvv,
      required this.cardHolderName,
      this.bankName = 'My Bank',
      this.cardFront = true});
  String cardNumber, expiryDate, cvv, cardHolderName, bankName;
  bool cardFront;
}
