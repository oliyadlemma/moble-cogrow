import 'package:flutter/material.dart';
import 'package:fluttersatrtup/profile_view.dart/InvestmentAmount.dart';

class AreasOfExpertisePage extends StatefulWidget {
  @override
  _AreasOfExpertisePageState createState() => _AreasOfExpertisePageState();
}

class _AreasOfExpertisePageState extends State<AreasOfExpertisePage> {
  final TextEditingController _controller = TextEditingController();
  String _errorMessage = '';

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("What are your areas of expertise?"),
              const SizedBox(
                height: 25,
              ),
              TextField(
                controller: _controller,
                onChanged: (value) {
                  if (_errorMessage.isNotEmpty) {
                    setState(() {
                      _errorMessage = '';
                    });
                  }
                },
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Enter your areas of expertise',
                  errorText: _errorMessage.isNotEmpty ? _errorMessage : null,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Eg: Tech, Accounting, Law, Fundraising...",
                style: TextStyle(color: Color.fromARGB(255, 15, 15, 15)),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _validateInput();
                },
                child: Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _validateInput() {
    final input = _controller.text.trim();

    if (input.isEmpty) {
      setState(() {
        _errorMessage = 'Please fill in your areas of expertise';
      });
    } else {
      // Navigate to the next page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => InvestmentAmountPage()),
      );
    }
  }
}
