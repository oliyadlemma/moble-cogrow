import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttersatrtup/profile_view.dart/invester_auth.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImagePage extends StatefulWidget {
  const ProfileImagePage({Key? key}) : super(key: key);

  @override
  State<ProfileImagePage> createState() => _ProfileImagePageState();
}

class _ProfileImagePageState extends State<ProfileImagePage> {
  File? selectedImage;
  String base64Image = "";

  Future<void> chooseImage(type) async {
    var image;
    if (type == "camera") {
      image = await ImagePicker().pickImage(
        source: ImageSource.camera,
      );
    } else {
      image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
    }
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
        base64Image = base64Encode(selectedImage!.readAsBytesSync());
      });
    }
  }

  void _navigateToInvesterauthPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InvesterauthPage(
          onTap: () {},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 74, 97, 126),
              Color.fromARGB(255, 164, 175, 190),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: Icon(Icons.photo_library),
                          title: Text('Image From Gallery'),
                          onTap: () {
                            Navigator.pop(context);
                            chooseImage("Gallery");
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.camera_alt),
                          title: Text('Image from Camera'),
                          onTap: () {
                            Navigator.pop(context);
                            chooseImage("camera");
                          },
                        ),
                      ],
                    ),
                  );
                },
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: const Color.fromARGB(255, 36, 34, 34),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: ClipOval(
                          child: selectedImage != null
                              ? Image.file(
                                  selectedImage!,
                                  fit: BoxFit.cover,
                                  height: 100,
                                  width: 100,
                                )
                              : Container(
                                  color: Colors
                                      .grey, // Empty image placeholder color
                                  height: 85,
                                  width: 85,
                                ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.6),
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                // Directly navigate to InvesterauthPage when skip button is pressed
                _navigateToInvesterauthPage();
              },
              child: const Text("Skip"),
            ),
            ElevatedButton(
              onPressed: selectedImage != null
                  ? () {
                      // For now, navigate to InvesterauthPage
                      _navigateToInvesterauthPage();
                    }
                  : null,
              // Disable the button if no image is selected
              child: const Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}
