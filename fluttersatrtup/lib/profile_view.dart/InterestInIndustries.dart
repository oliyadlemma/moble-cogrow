import 'package:flutter/material.dart';
import 'package:fluttersatrtup/profile_view.dart/ProfileImagePage.dart';

class InterestInIndustriesPage extends StatefulWidget {
  @override
  _InterestInIndustriesPageState createState() =>
      _InterestInIndustriesPageState();
}

class _InterestInIndustriesPageState extends State<InterestInIndustriesPage> {
  List<String> selectedIndustries = [];

  final List<String> industries = [
    'Food and Beverage',
    'Hospitality',
    'Restaurants and Bars',
    'Manufacturing and Engineering',
    'Media',
    'Medical and Sciences',
    'Personal Services',
    'Product and Invention',
    'Agriculture',
    'Business Services',
    'Education and Training',
    'Energy and Natural Resources',
    'Entertainment and Leisure',
    'Fashion and Beauty',
    'Finance',
  ];

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
                'Please select your industries of interest:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: industries.length,
                  itemBuilder: (context, index) {
                    final industry = industries[index];
                    return CheckboxListTile(
                      title: Text(industry),
                      value: selectedIndustries.contains(industry),
                      onChanged: (value) {
                        setState(() {
                          if (value!) {
                            selectedIndustries.add(industry);
                          } else {
                            selectedIndustries.remove(industry);
                          }
                        });
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (selectedIndustries.length >= 3) {
                    // Continue to the next page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfileImagePage()),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Error'),
                        content:
                            Text('Please select at least three industries.'),
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
                child: Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
