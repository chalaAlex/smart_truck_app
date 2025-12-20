
import 'package:flutter/material.dart';
import 'package:smart_truck_app/presentation/pages/fo_complete_profile/fo_complete_profile.dart';
import 'package:smart_truck_app/presentation/pages/fo_home_page/fo_home_page.dart';
import 'package:smart_truck_app/presentation/pages/to_complete_profile/add_vehicle.dart';
import 'package:smart_truck_app/presentation/pages/to_complete_profile/to_complete_profile.dart';
import 'package:smart_truck_app/presentation/pages/to_complete_profile/verification_pending.dart';
import 'package:smart_truck_app/presentation/pages/to_home_page/to_home_page.dart';

class Routes {
  static const String foCompleteProfile = "/foCompleteProfile";
  static const String toCompleteProfile = "/toCompleteProfile";
  static const String toHomePage = "/toHomePage";
  static const String foHomePage = "/foHomePage";
  static const String addVehicle = "/addVehicle";
  static const String verificationPending = "/verificationPending";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.foCompleteProfile:
        return MaterialPageRoute(builder: (_) => const FoCompleteProfile());

      case Routes.toCompleteProfile:
        return MaterialPageRoute(builder: (_) => const ToCompleteProfile());

      case Routes.toHomePage:
        return MaterialPageRoute(builder: (_) => const ToHomePage());

      case Routes.foHomePage:
        return MaterialPageRoute(builder: (_) => const FoHomePage());

      case Routes.addVehicle:
        return MaterialPageRoute(builder: (_) => const AddVehicle());

      case Routes.verificationPending:
        return MaterialPageRoute(builder: (_) => const VerificationPending());

      default:
        return MaterialPageRoute(builder: (_) => const FoCompleteProfile()); // Change later
    }
  }
}


