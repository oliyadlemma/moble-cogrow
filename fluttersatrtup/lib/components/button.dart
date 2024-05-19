import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const MyButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(16)),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Color.fromARGB(255, 209, 201, 201),
                fontWeight: FontWeight.bold,
                fontSize: 15),
          ),
        ),
      ),
    );
  }
}
