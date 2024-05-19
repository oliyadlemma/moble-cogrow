import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttersatrtup/profile_view.dart/ProfessionalBackground.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("profile"),
      ),
      body: Container(
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
              ListTile(
                title: Text('About Me'),
                subtitle: Text('Am an engineer and entrepreneur'),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProfessionalBackgroundPage(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                title: Text('My areas of expertise'),
                subtitle: Text('Tech'),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Handle edit action
                  },
                ),
              ),
              ListTile(
                title: Text('Investment range'),
                subtitle: Text('\$1 to \$500,000'),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Handle edit action
                  },
                ),
              ),
              ListTile(
                title: Text('stages'),
                subtitle:
                    Text("Achieving sales , BreakingEven ,  finished product"),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Handle edit action
                  },
                ),
              ),
              ListTile(
                title: Text('industries'),
                subtitle: Text("Agriculture , finance ,Media ,property"),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Handle edit action
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
