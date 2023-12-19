import 'package:calaton_firebase_auth/app/routing/inavigation_util.dart';
import 'package:calaton_firebase_auth/app/screens/phone_verification/screens/otp/otp_screen.dart';
import 'package:calaton_firebase_auth/app/screens/phone_verification/screens/phone/phone_verification_screen.dart';
import 'package:calaton_firebase_auth/app/services/auth_service.dart';
import 'package:calaton_firebase_auth/data/remote_storage/remote_storage.dart';
import 'package:calaton_firebase_auth/data/repository/user_auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/repository/users_repository.dart';
import '../home/home_screen.dart';
import '../home/home_view_model.dart';
import '../login/login_screen.dart';
import '../login/login_view_model.dart';
import '../phone_verification/screens/otp/otp_view_model.dart';
import '../phone_verification/screens/phone/phone_verification_view_model.dart';

class ScreenFactory {
  static Widget buildPhoneVerificationScreen() {
    return ChangeNotifierProvider<PhoneVerificationViewModel>(
      create: (context) => PhoneVerificationViewModel(
          navigationUtil: context.read<INavigationUtil>(),
          userRepository: UserAuthRepository()),
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
          userRepository: UserAuthRepository(),
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
        userRepository: UserAuthRepository(),
        usersRepository: UsersRepository(),
      ),
      child: Consumer<HomeViewModel>(
        builder: (context, model, child) => HomeScreen(viewModel: model),
      ),
    );
  }

  static Widget buildLogInScreen() {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (context) => LoginViewModel(
        userRepository: UserAuthRepository(),
        navigationUtil: context.read<INavigationUtil>(),
        remoteStorage: RemoteStorage(),
      ),
      child: Consumer<LoginViewModel>(
        builder: (context, model, child) => LoginScreen(viewModel: model),
      ),
    );
  }
}
