import 'package:calaton_firebase_auth/app/app_view_model.dart';
import 'package:calaton_firebase_auth/app/routing/navigation_util.dart';
import 'package:calaton_firebase_auth/app/routing/routing.dart';
import 'package:calaton_firebase_auth/app/screens/common/screen_factory.dart';
import 'package:calaton_firebase_auth/app/services/auth_service.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final AppViewModel viewModel;

  const App({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Routing.generateRoute,
      navigatorKey: NavigationUtil().navigatorKey,
      home: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder(
      stream: viewModel.authStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          switch (snapshot.data!) {
            case UserAuthState.loggedIn:
              return ScreenFactory.buildHomeScreen();
            case UserAuthState.signedOut:
              return ScreenFactory.buildLogInScreen();
          }
        } else {
          return ScreenFactory.buildLogInScreen();
        }
      },
    );
  }
}
