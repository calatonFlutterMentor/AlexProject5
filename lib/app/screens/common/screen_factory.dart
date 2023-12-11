import 'package:calaton_firebase_auth/app/routing/inavigation_util.dart';
import 'package:calaton_firebase_auth/app/screens/phone_verification/screens/otp/otp_screen.dart';
import 'package:calaton_firebase_auth/app/screens/phone_verification/screens/phone/phone_verification_screen.dart';
import 'package:calaton_firebase_auth/app/services/auth_service.dart';
import 'package:calaton_firebase_auth/data/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../home/home.dart';
import '../home/home_view_model.dart';
import '../login/login.dart';
import '../login/login_view_model.dart';
import '../phone_verification/screens/otp/otp_view_model.dart';
import '../phone_verification/screens/phone/phone_verification_view_model.dart';

class ScreenFactory {
  static Widget buildPhoneVerificationScreen() {
    return ChangeNotifierProvider<PhoneVerificationViewModel>(
      create: (context) => PhoneVerificationViewModel(
          navigationUtil: context.read<INavigationUtil>(),
          userRepository: UserRepository()),
      child: Consumer<PhoneVerificationViewModel>(
        builder: (context, model, child) =>
            PhoneVerificationScreen(viewModel: model),
      ),
    );
  }

  static Widget buildOtpScreen(String verificationCode) {
    return ChangeNotifierProvider<OtpViewModel>(
      create: (context) => OtpViewModel(
          navigationUtil: context.read<INavigationUtil>(),
          userRepository: UserRepository(),
          verificationCode: verificationCode),
      child: Consumer<OtpViewModel>(
        builder: (context, model, child) => OtpScreen(viewModel: model),
      ),
    );
  }

  static Widget buildHomeScreen() {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(
          navigationUtil: context.read<INavigationUtil>(),
          authService: context.read<AuthService>(),
          userRepository: UserRepository()),
      child: Consumer<HomeViewModel>(
        builder: (context, model, child) => HomeScreen(viewModel: model),
      ),
    );
  }

  static Widget buildLogInScreen() {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (context) => LoginViewModel(
        userRepository: UserRepository(),
        navigationUtil: context.read<INavigationUtil>(),
      ),
      child: Consumer<LoginViewModel>(
        builder: (context, model, child) => LoginScreen(viewModel: model),
      ),
    );
  }
}
