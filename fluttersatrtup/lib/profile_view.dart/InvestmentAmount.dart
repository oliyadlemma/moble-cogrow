import 'package:flutter/material.dart';
import 'package:fluttersatrtup/profile_view.dart/InterestInInvesting.dart';

class InvestmentAmountPage extends StatefulWidget {
  const InvestmentAmountPage({Key? key}) : super(key: key);

  @override
  _InvestmentAmountPageState createState() => _InvestmentAmountPageState();
}

class _InvestmentAmountPageState extends State<InvestmentAmountPage> {
  int _currentValue = 1; // Define _currentValue here

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
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("How much are you looking to invest ?"),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text("From 1\$ "),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Slider(
                      value: _currentValue.toDouble(),
                      min: 1,
                      max: 500000,
                      divisions: 500000, // Number of discrete divisions
                      onChanged: (double value) {
                        setState(() {
                          _currentValue = value.toInt();
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '\$$_currentValue',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(width: 20),
                  const Text(" \$  "),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the next page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => InterestInInvestingPage(),
                    ),
                  );
                },
                child: const Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
