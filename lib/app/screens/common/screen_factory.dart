import 'package:calaton_firebase_auth/app/app.dart';
import 'package:calaton_firebase_auth/app/app_view_model.dart';
import 'package:calaton_firebase_auth/app/routing/inavigation_util.dart';
import 'package:calaton_firebase_auth/app/services/auth_service.dart';
import 'package:calaton_firebase_auth/data/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../home/home.dart';
import '../home/home_view_model.dart';
import '../login/login.dart';
import '../login/login_view_model.dart';

class ScreenFactory {
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
              navigationUtil: context.read<INavigationUtil>(),),
      child: Consumer<LoginViewModel>(
        builder: (context, model, child) => LoginScreen(viewModel: model),
      ),
    );
  }

}
