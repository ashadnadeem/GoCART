import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../Controllers/address_provider.dart';
import '../../../Controllers/user_provider.dart';
import '../../../Entities/address_entity.dart';
import '../Address/add_address_page.dart';

// ignore: must_be_immutable
class AddressTile extends StatelessWidget {
  const AddressTile({Key? key, required this.address, this.editable = true})
      : super(key: key);
  final Address address;
  final bool editable;
  @override
  Widget build(BuildContext context) {
    final double screenSizeH = MediaQuery.of(context).size.height;
    final double fontsize = screenSizeH * 0.015;
    Widget editButton() {
      return IconButton(
        icon: Icon(Icons.edit_note_outlined, size: screenSizeH * 0.03),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddAddress(address: address),
          ));
        },
      );
    }

    Widget deleteButton() {
      return IconButton(
          icon: Icon(Icons.delete_forever_outlined,
              color: Colors.red, size: screenSizeH * 0.03),
          onPressed: () {
            // Delete Address from Firebase and Delink from User
            context.read<AddressProvider>().deleteAddress(address);
            context.read<UserProvider>().removeAddress(address.id);
            context.read<UserProvider>().saveChanges();
          });
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: SizedBox(
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
                  editable
                      ? address.defaultAddress
                          ? editButton()
                          : deleteButton()
                      : Container(width: 10),
                ],
              ),
              // AddressBody(address: address),
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
