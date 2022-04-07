import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/material.dart';
import 'package:gocart/AccountScreen_Pages/Account%20Main/account_main_page.dart';
import 'package:gocart/AccountScreen_Pages/Address/add_address_page.dart';
import 'package:gocart/AccountScreen_Pages/Payment/add_card_page.dart';
import 'package:gocart/MainScreen_Pages/U_ItemDetailPage.dart';
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

class topBar extends StatelessWidget implements PreferredSizeWidget {
  const topBar({Key? key, required this.implyLeading}) : super(key: key);
  final bool implyLeading;

  @override
  Widget build(BuildContext context) {
    double screenSizeW = MediaQuery.of(context).size.width;
    double screenSizeH = MediaQuery.of(context).size.height;

    return AppBar(
      backgroundColor: const Color.fromARGB(255, 59, 59, 61),
      // automaticallyImplyLeading: implyLeading,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(25),
        ),
      ),
      title: logo(
        primaryColor: Colors.white,
        secondaryColor: Colors.yellow,
        fontSize: screenSizeH * 0.035,
      ),
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.only(left: 26.0),
        child: !implyLeading
            ? IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => myAccount()),
                  );
                },
                icon: const Icon(Icons.account_circle_outlined),
                color: Colors.white,
                iconSize: 28,
              )
            : IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                color: Colors.white,
                iconSize: 28,
              ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 26.0),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
            color: Colors.white,
            iconSize: 28,
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
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
        fixedSize: Size(200, 60),
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
  addressTile({Key? key, required this.address}) : super(key: key);
  final Address address;
  @override
  Widget build(BuildContext context) {
    final double screenSizeH = MediaQuery.of(context).size.height;
    final double fontsize = screenSizeH * 0.015;
    Widget editButton() {
      return IconButton(
        icon: Icon(Icons.edit_note_outlined, size: screenSizeH * 0.03),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => addAddress(address: address),
          ));
        },
      );
    }

    Widget deleteButton() {
      return IconButton(
        icon: Icon(Icons.delete_forever_outlined,
            color: Colors.red, size: screenSizeH * 0.03),
        onPressed: () {},
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Container(
        width: MediaQuery.of(context).size.height * 0.8,
        child: Card(
          color: address.defaultAddress ? Colors.grey.shade300 : Colors.white,
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
                  address.defaultAddress ? Container() : editButton(),
                  Expanded(
                    child: Container(
                      color: Colors.black54,
                      height: 2,
                    ),
                  ),
                  address.defaultAddress ? editButton() : deleteButton(),
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
                    'Zip:            ',
                    style: GoogleFonts.poppins(
                      fontSize: fontsize,
                      fontWeight: FontWeight.w300,
                      color: Colors.black54,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      address.zip,
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
  bankCard(
      {required this.card, this.encrypt = false, Key? key, this.options = true})
      : super(key: key);
  final DebitCard card;
  bool encrypt;
  bool options;
  String cardEncrypt(String cardNumber) {
    // Put * and display only last 4 digits
    String card = '';
    card = cardNumber.substring(0, 4) +
        "*" * 8 +
        cardNumber.substring(cardNumber.length - 4, cardNumber.length);
    return card;
  }

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
    return Container(
      width: MediaQuery.of(context).size.height * 0.8,
      child: Row(
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
              cardNumber:
                  encrypt ? cardEncrypt(card.cardNumber) : card.cardNumber,
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
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => addCard(card: card),
                        ));
                      },
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
      ),
    );
  }
}

//Homepage Item Card
class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required this.screenWidth,
    required this.cardWidth,
    required this.hasSubtext,
    required this.isTrending,
    //required this.cardHeigth,
  }) : super(key: key);

  final double screenWidth;
  final double cardWidth;
  final bool hasSubtext;
  final bool isTrending;
  //final double cardHeigth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth * 0.92,
      height: !hasSubtext ? 120 : 180,
      // height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: isTrending
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ItemDetail(),
                  ));
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(27),
                  ),
                  color: index % 2 == 0
                      ? Colors.red
                      : const Color.fromARGB(255, 46, 44, 44),
                  child: SizedBox(
                    width: cardWidth,
                    height: 100,
                  ),
                ),
              ),
              if (hasSubtext)
                isTrending
                    ? Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Nike",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "Contour 40",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              "PKR 12,000",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      )
                    : const Text(
                        "Nike",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )
            ],
          );
        },
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
    required this.zip,
    this.defaultAddress = false,
  });
  String name, address, city, phone, zip;
  bool defaultAddress;
}

class DebitCard {
  DebitCard({
    required this.cardNumber,
    required this.expiryDate,
    required this.cvv,
    required this.cardHolderName,
    this.bankName = 'My Bank',
    this.cardFront = true,
  });
  String cardNumber, expiryDate, cvv, cardHolderName, bankName;
  bool cardFront;
}
