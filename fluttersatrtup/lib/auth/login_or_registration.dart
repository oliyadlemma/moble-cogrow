import 'package:flutter/material.dart';
import 'package:fluttersatrtup/pages/loginpage.dart';
import 'package:fluttersatrtup/pages/registration_page.dart';

class LoginorRegister extends StatefulWidget {
  const LoginorRegister({super.key});

  @override
  State<LoginorRegister> createState() => _LoginorRegisterState();
}

class _LoginorRegisterState extends State<LoginorRegister> {
  //initially show the login page
  bool showLoginpage = true;

  void togglepages() {
    setState(() {
      showLoginpage = !showLoginpage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginpage) {
      return Loginpage(onTap: togglepages);
    } else {
      return Registrationpage(onTap: togglepages);
    }
  }
}
