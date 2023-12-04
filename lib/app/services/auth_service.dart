import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

enum UserAuthState { signedOut, loggedIn }

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  StreamController<UserAuthState> get userAuthStateStreamController =>
      _userAuthStateStreamController;
  final StreamController<UserAuthState> _userAuthStateStreamController =
  StreamController.broadcast();

  Stream<UserAuthState> authState() {
    // todo subscriptions & disposes
    Stream<UserAuthState> stream = _firebaseAuth.authStateChanges().map((user) {
      if (user == null) {
       return UserAuthState.signedOut;
      } else {
       return UserAuthState.loggedIn;
      }
    });
    stream.listen((event) {
      _userAuthStateStreamController.add(event);
    });
    return _userAuthStateStreamController.stream;
  }

  dynamic getUser() {
    return _firebaseAuth.currentUser;
  }
}
