import 'package:flutter/material.dart';
import 'package:gocart/utils.dart';

class AccountDetails extends StatefulWidget {
  const AccountDetails({Key? key}) : super(key: key);

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController.text = "Ashad Nadeem";
    _emailController.text = "ashadnadeem@gmail.com";
    _cityController.text = "Karachi";
    _addressController.text = "E-7/2, Block-E, Gulshan-e-Iqbal";
    _phoneController.text = "0300-1234567";
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const MyAppBar(implyLeading: false),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: screenHeight * 0.02),
            // Login Banner
            const HeaderBar(title: "Account Details"),
            SizedBox(height: screenHeight * 0.03),
            SizedBox(
              width: screenHeight * 0.8,
              child: Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                child: Column(children: <Widget>[
                  // Profile Image
                  profilePic(),
                  // Name TextField
                  Row(children: const <Widget>[Text("  Name")]),
                  gocartTextField(
                      hint: "Name", editable: false, control: _nameController),
                  // Name TextField
                  Row(children: const <Widget>[Text("  Email")]),
                  gocartTextField(
                      hint: "Email",
                      editable: false,
                      control: _emailController),
                  // Address TextField
                  Row(children: const <Widget>[Text("  Address")]),
                  gocartTextField(
                    hint: "Address",
                    control: _addressController,
                    textType: TextInputType.streetAddress,
                  ),
                  // City TextField
                  Row(children: const <Widget>[Text("  City")]),
                  gocartTextField(
                    hint: "City",
                    control: _cityController,
                  ),
                  // Phone Number TextField
                  Row(children: const <Widget>[Text("  Phone Number")]),
                  gocartTextField(
                    hint: "Phone Number",
                    control: _phoneController,
                    textType: TextInputType.phone,
                  ),
                ]),
              ),
            ),
            // Login Button
            coolButton(
                text: "Save",
                // width: screenWidth * 0.5,
                // height: screenHeight * 0.07,
                // textSize: screenWidth * 0.05,
                functionToComply: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
      // bottomNavigationBar: const bottomBar(),
    );
  }

  Widget profilePic() {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          height: screenHeight * 0.15,
          width: screenHeight * 0.15,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                  "https://avatars.githubusercontent.com/u/58692788?v=4"),
            ),
          ),
        ),
        Positioned(
          top: screenHeight * 0.10,
          right: screenHeight * 0.00,
          child: Container(
            height: screenHeight * 0.05,
            width: screenHeight * 0.05,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.edit,
                color: Colors.black,
              ),
              onPressed: () {
                // Select Image from Gallery to upload
                // flutter pub add image_picker
              },
            ),
          ),
        ),
      ],
    );
  }
}
