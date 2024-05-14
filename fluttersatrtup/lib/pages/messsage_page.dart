import 'package:flutter/material.dart';

class messagepage extends StatelessWidget {
  const messagepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9.0),
      ),
    );
  }
}
