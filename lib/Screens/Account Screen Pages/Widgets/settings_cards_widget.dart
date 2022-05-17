import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// coolCardTemplate: a card with a icon and a title
class AccountSettingCard extends StatelessWidget {
  const AccountSettingCard({
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
          child: SizedBox(
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
