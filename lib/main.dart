import 'package:flutter/material.dart';

import 'home_page_view.dart';

void main() {
  runApp(const MyApp());
}

// Password Strength Checker 🔥🚀

// github: https://github.com/Cuma0 👨‍💻

// instagram: @artinflutterland 👋

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Password Checker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePageView(),
    );
  }
}
