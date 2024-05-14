import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttersatrtup/components/button.dart';
import 'package:fluttersatrtup/components/text_field.dart';
import 'package:fluttersatrtup/pages/homepage.dart';

class Loginpage extends StatefulWidget {
  final Function()? onTap;
  const Loginpage({super.key, required this.onTap});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final emailTextController = TextEditingController();
  final passWordTextController = TextEditingController();

  //sign user in
  Future<void> signIn() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
    //try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailTextController.text,
        password: passWordTextController.text,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Homepage()),
      );
      //pop loding circle
      // if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop loding circle
      Navigator.pop(context);
      //display error message
      dispalyMessage(e.code);
    }
  }

  //display a dialog message
  void dispalyMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //logo
                const Icon(
                  Icons.lock,
                  size: 60,
                ),
                const SizedBox(
                  height: 35,
                ),
                //wellcome  message
                const Text(
                  'WELLCOME Back To Cogrow Networking Platform',
                  style: TextStyle(
                    fontSize: 15,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                //email textfield
                MyTextField(
                    controller: emailTextController,
                    hintText: 'EMAIL',
                    obscureText: false),
                //password textfield
                const SizedBox(
                  height: 15,
                ),
                MyTextField(
                    controller: passWordTextController,
                    hintText: 'password',
                    obscureText: true),
                //sign in  button
                const SizedBox(
                  height: 15,
                ),
                MyButton(onTap: signIn, text: 'Sign in'),
                // go to registration page
                const SizedBox(
                  height: 19,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'sign up',
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
    );
  }
}
