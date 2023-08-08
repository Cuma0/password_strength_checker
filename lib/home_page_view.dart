import 'package:flutter/material.dart';
import 'sign_up_page_view.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        child: Text("next"),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SignUpPageView()));
        },
      )),
    );
  }
}
