import 'package:flutter/material.dart';
import 'package:smart_truck_app/presentation/resources/route_manager.dart';

class FoCompleteProfile extends StatelessWidget {
  const FoCompleteProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text("FO COMPLETE PROFILE")),

          ElevatedButton(
            onPressed: () {
              // TODO: TAKE THE USER TO FO HOMEPAGE SCREEN
              Navigator.pushNamed(context, Routes.foHomePage);
            },
            child: Text("Complete"),
          ),
        ],
      ),
    );
  }
}
