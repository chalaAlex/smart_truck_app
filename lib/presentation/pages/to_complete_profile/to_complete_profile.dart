import 'package:flutter/material.dart';
import 'package:smart_truck_app/presentation/resources/route_manager.dart';

class ToCompleteProfile extends StatelessWidget {
  const ToCompleteProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text("TO COMPLETE PROFILE")),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.addVehicle);
              // TODO: TAKE THE USER TO TO HOMEPAGE SCREEN
            },
            child: Text("Next"),
          ),
        ],
      ),
    );
  }
}
