import 'package:flutter/material.dart';

class FoHomePage extends StatelessWidget {
  const FoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text("FO HOME PAGE")),

          // ElevatedButton(
          //   onPressed: () {
          //     // TODO: TAKE THE USER TO FO HOMEPAGE SCREEN
          //   },
          //   child: Text("Complete"),
          // ),
        ],
      ),
    );
  }
}
