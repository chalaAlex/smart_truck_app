import 'package:flutter/material.dart';

class VerificationPending extends StatelessWidget {
  const VerificationPending({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text("Verification Pending Screen")),
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
