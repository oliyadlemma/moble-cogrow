import 'package:flutter/material.dart';
import 'package:fluttersatrtup/profile_view.dart/AreasOfExpertise.dart';

class ProfessionalBackgroundPage extends StatefulWidget {
  
  @override
  _ProfessionalBackgroundPageState createState() =>
      _ProfessionalBackgroundPageState();
}

class _ProfessionalBackgroundPageState
    extends State<ProfessionalBackgroundPage> {
  final TextEditingController _controller = TextEditingController();
  String _errorMessage = '';
  String _professionalBackground = '';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "What's Your Professional Background ?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _controller,
                onChanged: (value) {
                  setState(() {
                    _professionalBackground = value;
                    _errorMessage = '';
                  });
                },
                decoration: InputDecoration(
                  hintText: "Enter your professional background",
                ),
              ),
              SizedBox(height: 20),
              if (_errorMessage.isNotEmpty)
                Text(
                  _errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
              SizedBox(height: 20),
              Text(
                "Tell entrepreneurs a little bit about your background",
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _validateInput();
                  },
                  child: Text('Continue'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _validateInput() {
    final input = _professionalBackground.trim();

    if (input.isEmpty) {
      setState(() {
        _errorMessage = 'Please fill in your professional background';
      });
    } else {
      // Clear previous error message
      setState(() {
        _errorMessage = '';
      });
      // Navigate to the next page

      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => AreasOfExpertisePage()),
      );
    }
  }
}
