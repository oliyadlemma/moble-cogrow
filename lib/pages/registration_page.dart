import 'package:flutter/material.dart';
import 'package:fluttersatrtup/components/button.dart';
import 'package:fluttersatrtup/components/text_field.dart';
//import 'package:fluttersatrtup/pages/homepage.dart';

class Registrationpage extends StatefulWidget {
  final Function()? onTap;
  const Registrationpage({super.key, required this.onTap});

  @override
  State<Registrationpage> createState() => _RegistrationpageState();
}

class _RegistrationpageState extends State<Registrationpage> {
  //text editing controller
  final firstNameTextController = TextEditingController();
  final lastNameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passWordTextController = TextEditingController();
  final confirmTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Color.fromARGB(255, 74, 97, 126),
              Color.fromARGB(255, 164, 175, 190)
            ])),
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //wellcome  message
                    const Center(
                      child: Text(
                        'WELLCOME To Cogrow Networking Platform',
                        style: TextStyle(
                          fontSize: 25,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    //FirstName textfield
                    MyTextField(
                        controller: firstNameTextController,
                        hintText: 'FirstName',
                        obscureText: false),
                    const SizedBox(
                      height: 10,
                    ),
                    //LastName textfield
                    MyTextField(
                        controller: lastNameTextController,
                        hintText: 'LastName',
                        obscureText: false),
                    const SizedBox(
                      height: 10,
                    ),
                    //email textfield
                    MyTextField(
                        controller: emailTextController,
                        hintText: 'EMAIL',
                        obscureText: false),
                    const SizedBox(
                      height: 10,
                    ),
                    //password textfield
                    MyTextField(
                        controller: passWordTextController,
                        hintText: 'password',
                        obscureText: true),
                    const SizedBox(
                      height: 10,
                    ),
                    //confirmpassword textfield
                    MyTextField(
                        controller: confirmTextController,
                        hintText: 'confirmpassword',
                        obscureText: true),
                    const SizedBox(
                      height: 10,
                    ),

                    //sign in  button
                    MyButton(onTap: () {}, text: 'Sign Up'),
                    const SizedBox(
                      height: 19,
                    ),
                    // go to registration page
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: const Text(
                            'Login now',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 37, 94, 141)),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
