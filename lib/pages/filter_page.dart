import 'package:flutter/material.dart';

// FilterPage
class FilterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => IndustryPage()),
              );
            },
            child: const Text('Industries'),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StagePage()),
              );
            },
            child: const Text('Stages'),
          ),
        ],
      ),
    );
  }
}

// IndustryPage
class IndustryPage extends StatelessWidget {
  final List<String> industries = [
    'Agriculture',
    'Business Service',
    'Education & Training',
    'Energy & Natural Resources',
    'Entertainment & Leisure',
    'Fashion and Beauty',
    'Finance',
    'Food and Beverage',
    'Hospitality',
    'Transportation',
    'Technology',
    'Software',
    'Sales & Marketing',
    'Retail',
    'Property',
    'Product & Invention',
    'Personal Services',
    'Medical & Science',
    'Media',
    'Manufacture and Engineering',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Industry'),
      ),
      body: ListView.builder(
        itemCount: industries.length,
        itemBuilder: (context, index) {
          return ElevatedButton(
            onPressed: () {
              // Perform your action here without navigating back
              print('Selected Industry: ${industries[index]}');
              // You can also update some state or call a function
            },
            child: Text(industries[index]),
          );
        },
      ),
    );
  }
}

// StagePage
class StagePage extends StatelessWidget {
  final List<String> stages = [
    'Achieving Sales',
    'Breaking Even',
    'MVC/Finished Product',
    'Other',
    'Pre-startup/R&D',
    'Profitable',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Stage'),
      ),
      body: ListView.builder(
        itemCount: stages.length,
        itemBuilder: (context, index) {
          return ElevatedButton(
            onPressed: () {
              print('Selected Stage: ${stages[index]}');
            },
            child: Text(stages[index]),
          );
        },
      ),
    );
  }
}
