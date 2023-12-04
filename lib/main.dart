import 'package:calaton_firebase_auth/app/routing/inavigation_util.dart';
import 'package:calaton_firebase_auth/app/routing/navigation_util.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app/app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  INavigationUtil navigationUtil = NavigationUtil();
  runApp(
    MultiProvider(
      providers: [
        Provider.value(value: navigationUtil),
      ],
      child: const App(),
    ),
  );
}
