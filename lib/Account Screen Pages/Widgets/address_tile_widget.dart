import 'package:flutter/material.dart';
import 'package:gocart/Account%20Screen%20Pages/Address/U_EditAddressForm.dart';
import 'package:gocart/Models/address_model.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class AddressTile extends StatelessWidget {
  AddressTile({Key? key, this.defaultAddress = false, required this.address})
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
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => EditAddress(),
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
