import 'dart:async';
import 'package:calaton_firebase_auth/domain/user/iuser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/user/iusers_repository.dart';
import '../model/user.dart';

class RemoteStorage implements IUsersRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<void> create(email) async {
    final docUser = _firebaseFirestore.collection('users').doc();
    final user = User(
      email: email,
      id: docUser.id,
    );
    final json = user.toJson();
    return await docUser.set(json);
  }

  @override
  Future<List<dynamic>> fetchUsers(collection) async {
    QuerySnapshot snapshot =
        await _firebaseFirestore.collection(collection).get();
    return snapshot.docs;
  }

  @override
  Future<void> remove() {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  Future update() {
    // TODO: implement update
    throw UnimplementedError();
  }
}
