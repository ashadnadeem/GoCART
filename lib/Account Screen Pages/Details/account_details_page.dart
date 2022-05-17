import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gocart/Entities/user_auth_entity.dart';
import 'package:gocart/Entities/user_entity.dart';
import 'package:gocart/Models/user_model.dart';
import 'package:gocart/utils.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../Controllers/user_provider.dart';

class AccountDetails extends StatefulWidget {
  UserProfile userProfile;
  AccountDetails({
    required this.userProfile,
    Key? key,
  }) : super(key: key);

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  final FirebaseStorage _storage = FirebaseStorage.instance;
  late Reference _storageReference;
  bool _isUploading = false;
  late UserProfile userProfile;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userProfile = widget.userProfile;
    _nameController.text = userProfile.name;
    _cityController.text = userProfile.city;
    _addressController.text = userProfile.address;
    _phoneController.text = userProfile.phone;
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final _user = Provider.of<UserAuth?>(context);
    _emailController.text = _user!.email;

    void _register() {
      // Update in UserProfile
      context.read<UserProvider>().updateUserInfo(
          name: _nameController.text,
          address: _addressController.text,
          city: _cityController.text,
          phone: _phoneController.text);
      context.read<UserProvider>().saveChanges();
      Navigator.pop(context);
    }

    Future<String?> uploadPic() async {
      //Get the file from the image picker and store it
      final pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        maxHeight: 1024,
        maxWidth: 1024,
        imageQuality: 50,
      );
      File image;
      if (pickedFile != null) {
        image = File(pickedFile.path);
        print("Image Selected, Path: ${image.path}");
      } else {
        print('No image selected.');
        return null;
      }
      _isUploading = true;
      setState(() {});
      //Create a reference to the location you want to upload to in firebase
      _storageReference = _storage.ref().child("profileImages/${_user.id}");

      //Upload the file to firebase
      UploadTask uploadTask = _storageReference.putFile(image);
      print("Uploading...");
      // Waits till the file is uploaded then stores the download url
      String location = await (await uploadTask.whenComplete(() => null))
          .ref
          .getDownloadURL();
      print("Uploaded to: $location");
      //returns the download url
      return location;
    }

    Widget profilePic() {
      final double screenHeight = MediaQuery.of(context).size.height;
      return Stack(
        children: [
          Container(
            height: screenHeight * 0.15,
            width: screenHeight * 0.15,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(userProfile.display.isEmpty
                    ? "https://img.icons8.com/bubbles/50/000000/user.png"
                    : userProfile.display),
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
                onPressed: () async {
                  // Select Image from Gallery to upload
                  final String? image = await uploadPic();
                  if (image != null) {
                    context
                        .read<UserProvider>()
                        .updateUserDisplay(image.toString());
                    context.read<UserProvider>().saveChanges();
                    _isUploading = false;
                    setState(() {});
                  } else {
                    print("No image selected");
                  }
                },
              ),
            ),
          ),
        ],
      );
    }

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
                child: Stack(children: [
                  Column(children: <Widget>[
                    // Profile Image
                    profilePic(),
                    // Name TextField
                    Row(children: const <Widget>[Text("  Name")]),
                    gocartTextField(
                        hint: "Name", editable: true, control: _nameController),
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
                  _isUploading
                      ? BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: Container(),
                        )
                      : Container(),
                  _isUploading
                      ? const Center(heightFactor: 5.0, child: JumpingLogo())
                      : Container(),
                ]),
              ),
            ),
            // Login Button
            coolButton(
              text: _isUploading ? "Please wait" : "Save",
              functionToComply: _isUploading ? () {} : _register,
            ),
          ],
        ),
      ),
      // bottomNavigationBar: const bottomBar(),
    );
  }
}
