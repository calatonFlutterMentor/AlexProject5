import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

enum UserAuthState { signedOut, loggedIn }

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  StreamController<UserAuthState> get userAuthStateStreamController =>
      _userAuthStateStreamController;
  final StreamController<UserAuthState> _userAuthStateStreamController =
  StreamController.broadcast();
  StreamSubscription<UserAuthState> get userAuthStateStreamSubscription =>
      _userAuthStateStreamSubscription;
  late StreamSubscription<UserAuthState> _userAuthStateStreamSubscription;

  Stream<UserAuthState> authState() async* {
   // _userAuthStateStreamController.close();
    // todo subscriptions & disposes
    Stream<UserAuthState> stream = _firebaseAuth.authStateChanges().map((user) {
      if (user == null) {
       return UserAuthState.signedOut;
      } else {
       return UserAuthState.loggedIn;
      }
    });
    _userAuthStateStreamSubscription = stream.listen((event) {
      _userAuthStateStreamController.add(event);
    });
    yield* _userAuthStateStreamController.stream;
    _userAuthStateStreamSubscription.cancel();
  }
  void closeStreamController(){
    _userAuthStateStreamController.close();
    print(_userAuthStateStreamController.isClosed);
  }
  dynamic getUser() {
    return _firebaseAuth.currentUser;
  }
}
