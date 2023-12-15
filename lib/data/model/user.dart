import '../../domain/user/iuser.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class User implements IUser {
  @override
  final String email;

  @override
  final String id;

  const User({required this.email, this.id = ""});

  factory User.fromFirebaseAuthUser(
    firebase_auth.User firebaseUser,
  ) {
    return User(email: firebaseUser.email ?? "", id: firebaseUser.uid);
  }

  User.fromJson(Map<String, dynamic> json)
      : email = json["email"] as String,
        id = json["id"] as String;

  Map<String, dynamic> toJson() => {'email': email, 'id': id};
}
