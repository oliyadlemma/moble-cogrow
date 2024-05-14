import 'package:flutter/material.dart';
import 'package:fluttersatrtup/auth/login_or_registration.dart';
// Import the LoginOrRegister page

class InvesterauthPage extends StatefulWidget {
  const InvesterauthPage({Key? key, required Null Function() onTap})
      : super(key: key);

  @override
  _InvesterauthPageState createState() => _InvesterauthPageState();
}

class _InvesterauthPageState extends State<InvesterauthPage> {
  bool agreeToPrivacyPolicy = false;
  bool agreeToTerms = false;
  bool certifyHighNetWorth = false;

  bool canContinue() {
    return agreeToPrivacyPolicy && agreeToTerms && certifyHighNetWorth;
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Before You can Continue your Signup',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              CheckboxListTile(
                title:
                    Text("I agree to Cogrow Network platform privacy policy"),
                value: agreeToPrivacyPolicy,
                onChanged: (value) {
                  setState(() {
                    agreeToPrivacyPolicy = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(
                    "I agree to Cogrow Network platform Terms and conditions"),
                value: agreeToTerms,
                onChanged: (value) {
                  setState(() {
                    agreeToTerms = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(
                    "I certify that I am a high net worth individual or sophisticated investor"),
                value: certifyHighNetWorth,
                onChanged: (value) {
                  setState(() {
                    certifyHighNetWorth = value!;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: canContinue()
                    ? () {
                        // Logic to navigate to LoginOrRegister page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginorRegister()),
                        );
                      }
                    : null,
                child: Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
