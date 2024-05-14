import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttersatrtup/pages/profile_page.dart';

import 'package:fluttersatrtup/theme/theme_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDXfzO3M1MfOLqOVpIcGnSDjxKIUIsLDjU",
          appId: "1:673149531742:android:e821c3e3e73fa11787e6cf",
          messagingSenderId: "673149531742",
          projectId: "investorlink-44f1c",
          databaseURL:
              "https://investorlink-44f1c-default-rtdb.firebaseio.com/"));

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
      //LoginorRegister(),
      //Homepage(),
      //ProfessionalBackgroundPage()
      //ProfileImagePage
      //AuthPage()
      // FilterPage()
    );
  }
}
