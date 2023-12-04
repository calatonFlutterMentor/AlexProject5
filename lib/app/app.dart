import 'package:calaton_firebase_auth/app/routing/inavigation_util.dart';
import 'package:calaton_firebase_auth/app/routing/navigation_util.dart';
import 'package:calaton_firebase_auth/app/routing/routing.dart';
import 'package:calaton_firebase_auth/app/screens/common/screen_factory.dart';
import 'package:calaton_firebase_auth/app/screens/home/home.dart';
import 'package:calaton_firebase_auth/app/screens/home/home_view_model.dart';
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
            userRepository: UserRepository()),
        child: Consumer<HomeViewModel>(
          builder: (context, model, child) {
            return FutureBuilder(
              future: model.isSignedIn(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data == true) {
                    return HomeScreen(viewModel: model);
                  } else {
                    return ScreenFactory.buildLogInScreen();
                  }
                } else {
                  return ScreenFactory.buildLogInScreen();
                }
              },
            );
          },
        ),
      )
    );
  }
}