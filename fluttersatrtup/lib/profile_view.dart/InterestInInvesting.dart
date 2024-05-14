import 'package:flutter/material.dart';
import 'package:fluttersatrtup/profile_view.dart/InterestInIndustries.dart';

class InterestInInvestingPage extends StatefulWidget {
  @override
  _InterestInInvestingPageState createState() =>
      _InterestInInvestingPageState();
}

class _InterestInInvestingPageState extends State<InterestInInvestingPage> {
  List<String> interests = [
    'Achieving sale',
    'Breaking Even',
    'MVP/Finished product',
    'Other',
    'Pre-startup/R&D',
    'Profitable'
  ];

  List<bool> isChecked = List.generate(
      6, (index) => false); // Initialize with all checkboxes unchecked

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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Which stages are you interested in investing in?',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: interests.length,
                  itemBuilder: (context, index) {
                    return CheckboxListTile(
                      title: Text(interests[index]),
                      value: isChecked[index],
                      onChanged: (value) {
                        setState(() {
                          isChecked[index] = value!;
                        });
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Check if at least one option is selected
                  bool hasSelected = isChecked.any((element) => element);
                  if (hasSelected) {
                    // Navigate to the next page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => InterestInIndustriesPage(),
                      ),
                    );
                  } else {
                    // Show error message if no option is selected
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Error'),
                        content: Text('Please choose at least one option.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
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
