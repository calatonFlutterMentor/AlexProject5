import 'package:calaton_firebase_auth/app/routing/route_constants.dart';
import 'package:flutter/material.dart';

import '../screens/common/screen_factory.dart';

class Routing {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.phoneVerification:
        return _buildPhoneVerificationScreen(settings);
      case RouteConstants.otpCode:
        return _buildOtpScreen(settings);
      case RouteConstants.login:
        return _buildLoginScreen(settings);
      case RouteConstants.home:
        return _buildHomeScreen(settings);
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text("Something went wrong!"),
                  ),
                ));
    }
  }

  static PageRoute _buildPhoneVerificationScreen(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (context) {
          return ScreenFactory.buildPhoneVerificationScreen();
        },
        settings: settings);
  }

  static PageRoute _buildOtpScreen(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (context) {
          return ScreenFactory.buildOtpScreen();
        },
        settings: settings);
  }

  static PageRoute _buildLoginScreen(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (context) {
          return ScreenFactory.buildLogInScreen();
        },
        settings: settings);
  }

  static PageRoute _buildHomeScreen(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (context) {
          return ScreenFactory.buildHomeScreen();
        },
        settings: settings);
  }
}
