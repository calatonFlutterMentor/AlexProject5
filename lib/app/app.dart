import 'package:calaton_firebase_auth/app/routing/inavigation_util.dart';
import 'package:calaton_firebase_auth/app/routing/navigation_util.dart';
import 'package:calaton_firebase_auth/app/routing/routing.dart';
import 'package:calaton_firebase_auth/app/screens/common/screen_factory.dart';
import 'package:calaton_firebase_auth/app/screens/home/home.dart';
import 'package:calaton_firebase_auth/app/screens/home/home_view_model.dart';
import 'package:calaton_firebase_auth/app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/repository/user_repository.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        onGenerateRoute: Routing.generateRoute,
        navigatorKey: NavigationUtil().navigatorKey,
        home: ChangeNotifierProvider<HomeViewModel>(
          create: (context) => HomeViewModel(
              navigationUtil: context.read<INavigationUtil>(),
              userRepository: UserRepository(),
              authService: context.read<AuthService>()),
          child: Consumer<HomeViewModel>(
            builder: (context, model, child) {
              return StreamBuilder(
                stream: context.read<AuthService>().authState(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    switch (snapshot.data) {
                      case UserAuthState.loggedIn:
                        return ScreenFactory.buildHomeScreen();
                      case UserAuthState.signedOut:
                      case null:
                        return ScreenFactory.buildLogInScreen();
                    }
                  } else {
                    return ScreenFactory.buildLogInScreen();
                  }
                },
              );
            },
          ),
        ));
  }
}
