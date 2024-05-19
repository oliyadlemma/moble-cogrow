import 'package:flutter/material.dart';
import 'package:fluttersatrtup/CustomUI/CustomCard.dart';

class messagepage extends StatelessWidget {
  const messagepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "message",
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.w800),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            CustomCard(),
            CustomCard(),
            CustomCard(),
            CustomCard(),
            CustomCard(),
            CustomCard(),
          ],
        ));
  }
}
