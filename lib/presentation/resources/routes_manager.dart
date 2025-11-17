import 'package:easy_logistics/presentation/pages/about/about_page.dart';
import 'package:easy_logistics/presentation/pages/about_us/about_us.dart';
import 'package:easy_logistics/presentation/pages/assign_carrier/assign_carrier.dart';
import 'package:easy_logistics/presentation/pages/auth/login_page.dart';
import 'package:easy_logistics/presentation/pages/forgot_password/forgot_passwod_screen.dart';
import 'package:easy_logistics/presentation/pages/home_easy/home_easy.dart';
import 'package:easy_logistics/presentation/pages/profile/profile_edit_screen.dart';
import 'package:easy_logistics/presentation/pages/profile/success_page.dart';
import 'package:easy_logistics/presentation/pages/profile_page/profile_page_screen.dart';
import 'package:easy_logistics/presentation/pages/main_view.dart';
import 'package:easy_logistics/presentation/pages/navigation_bar.dart';
import 'package:easy_logistics/presentation/pages/onboarding/onboarding.dart';
import 'package:easy_logistics/presentation/pages/order_filter/order_filter.dart';
import 'package:easy_logistics/presentation/pages/resources/order_create_form.dart';
import 'package:easy_logistics/presentation/pages/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String onBoardingRoute = "/onBoarding";
  static const String splashScreenRoute = "/splashScreen";
  static const String mainRoute = "/homepage";
  static const String orderCreateForm = "/orderCreateForm";
  static const String successPage = "/successPage";
  static const String verify_otp_screen = "/verofyOTP";
  static const String profileEditForm = "/profileEditForm";
  static const String succcessPage = "/succcessPage";

  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String aboutRoute = '/about';
  static const String profileRoute = '/profileRoute';

  // Drawer screens
  static const String forgotPasswordRoute = '/forgotPassword';
  static const String orderGroupRoute = '/orderGroup';
  static const String assignCarrierRoute = '/assignCarrier';
  static const String aboutUsRoute = '/assignCarrier';
  static const String successfullOrderRoute = '/successfullOrder';

  static const String exploreRoute = '/explore';
  static const String favoritesRoute = '/favourites';

  static const String bottomNavBarRoute = '/favourites';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.bottomNavBarRoute:
        return MaterialPageRoute(builder: (_) => const BottomNavBar());

      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case Routes.splashScreenRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginPage());

      case Routes.aboutRoute:
        return MaterialPageRoute(builder: (_) => const AboutView());

      case Routes.orderCreateForm:
        return MaterialPageRoute(builder: (_) => OrderCreateForm());

      case Routes.orderGroupRoute:
        return MaterialPageRoute(builder: (_) => const OrderFilter());

      case Routes.assignCarrierRoute:
        return MaterialPageRoute(builder: (_) => const AssignCarriercreen());

      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());

      case Routes.successfullOrderRoute:
        return MaterialPageRoute(builder: (_) => const AboutUsScreen());

      case Routes.profileRoute:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());

      case Routes.succcessPage:
        return MaterialPageRoute(builder: (_) => SuccessPage());

      case Routes.profileEditForm:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());

      default:
        return MaterialPageRoute(builder: (_) => const MainView());
    }
  }
}

