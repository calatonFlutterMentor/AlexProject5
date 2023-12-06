import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

enum UserAuthState { signedOut, loggedIn }

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final StreamController<UserAuthState> _streamController =
      StreamController.broadcast();
  StreamSubscription? _subscription;

  Stream<UserAuthState> authState() {
    Stream<UserAuthState> stream = _firebaseAuth.authStateChanges().map((user) {
      if (user == null) {
        return UserAuthState.signedOut;
      } else {
        return UserAuthState.loggedIn;
      }
    });
    _subscription = stream.listen((event) {
      _streamController.add(event);
    });
    return _streamController.stream;
  }

  void closeStreamController() {
    _streamController.close();
  }

  void cancelSubscription() {
    _subscription?.cancel();
  }
}
