import '../../domain/user/iuser.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class User implements IUser {
  @override
  final String email;

  @override
  final String id;

  User({required this.email, required this.id});

  factory User.fromFirebaseAuthUser(
    firebase_auth.User firebaseUser,
  ) {
    return User(email: firebaseUser.email ?? "", id: firebaseUser.uid);
  }
}
