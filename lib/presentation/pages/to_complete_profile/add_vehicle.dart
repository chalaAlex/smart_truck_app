import 'package:flutter/material.dart';
import 'package:smart_truck_app/presentation/resources/route_manager.dart';

class AddVehicle extends StatelessWidget {
  const AddVehicle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text("Add vehicle")),

          ElevatedButton(
            onPressed: () {
              // TODO: TAKE THE USER TO FO HOMEPAGE SCREEN
              Navigator.pushNamed(context, Routes.verificationPending);
            },
            child: Text("Complete"),
          ),
        ],
      ),
    );
  }
}
